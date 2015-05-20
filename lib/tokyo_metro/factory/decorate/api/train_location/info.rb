class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def initialize( request , obj , railway_line )
    super( request , obj )
    @railway_line = railway_line
  end

  attr_reader :railway_line

  def render
    h_locals_i = {
      this: self ,
      train_type_in_api_decorated: train_type_in_api_decorated ,
      starting_station_decorated: starting_station_decorated ,
      terminal_station_decorated: terminal_station_decorated
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%div{ class: :train_location , id: this.object.train_number.downcase }
  %div{ class: :train_fundamental_infos }
    = this.railway_line.decorate.render_matrix( make_link_to_railway_line: false , size: :small )
    %div{ class: :train_infos }
      = train_type_in_api_decorated.render_in_train_location
      = terminal_station_decorated.render_as_terminal_station
  = this.render_current_position
  %div{ class: :sub_infos }
    = this.render_delay
    = starting_station_decorated.render_as_starting_station
    = this.render_train_number
    HAML
  end

  def render_train_number
    str = object.train_number
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%div{ class: :train_number }
  %div{ class: :title_of_train_number }
    %p{ class: :text_ja }<
      = "列車番号"
    %p{ class: :text_en }<
      = "Train number "
  %div{ class: [ :train_number_text , :text_en ] }<
    = str
    HAML
  end

  def render_current_position
    station_infos = [ :from_station , :to_station ].map { | attr_name |
      object.send( attr_name )
    }.select( &:present? ).map { | station_info_same_as |
      case station_info_same_as
      when "odpt.Station:TokyoMetro.Chiyoda.KitaAyase"
        "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase"
      else
        station_info_same_as
      end
    }.map { | station_info_same_as |
      ::Station::Info.find_by( same_as: station_info_same_as )
    }

    h.render inline: <<-HAML , type: :haml , locals: { request: request , station_infos: station_infos }
%div{ class: :current_position }
  %div{ class: :title_of_current_position }
    %p{ class: :text_ja }<
      = "現在位置"
    %p{ class: :text_en }<
      = "Now at"
  %div{ class: :station_infos }<
    - station_infos.each.with_index(1) do | station_info , i |
      = station_info.decorate.train_location.render_name
      - unless i == station_infos.length
        %div{ class: :arrow }
          = ::TokyoMetro::App::Renderer::Icon.caret_down( request , 2 ).render
    HAML
  end

  def render_delay
    object.delay_instance.decorate( request ).render_in_location_of_each_train
  end

  private

  def train_type_in_api_decorated
    ::TrainTypeInApi.find_by( same_as: object.train_type ).decorate
  end

  def starting_station_decorated
    ::Station::Info.find_by( same_as: object.starting_station ).decorate.train_location
  end

  def terminal_station_decorated
    ::Station::Info.find_by( same_as: object.terminal_station ).decorate.train_location
  end

end