class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def initialize( request , obj , railway_line )
    super( request , obj )
    @railway_line = railway_line
  end

  attr_reader :railway_line

  def render
    h_locals_i = {
      this: self ,
      train_type_decorated: train_type_decorated ,
      starting_station_decorated: starting_station_decorated ,
      terminal_station_decorated: terminal_station_decorated
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%li{ class: [ :train_location , this.railway_line.css_class_name , :clearfix ] , id: this.object.train_number.downcase }
  %div{ class: :train_fundamental_infos }
    = this.railway_line.decorate.render_matrix( make_link_to_railway_line: false , size: :very_small )
    = train_type_decorated.render_in_train_location
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
%div{ class: [ :train_number , :clearfix ] }
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
  %p{ class: [ :title_of_current_position , :text_ja ] }
    = "現在位置"
    %span{ class: :text_en }<
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

  def train_type_decorated
    if train_type.present?
      return train_type.decorate
    end

    if object.train_type == "odpt.TrainType:TokyoMetro.RomanceCar" and object.railway_line == "odpt.Railway:TokyoMetro.Chiyoda"
      return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.Normal" ).decorate

    elsif object.railway_line == "odpt.Railway:TokyoMetro.Yurakucho"

      case object.train_type
      when "odpt.TrainType:TokyoMetro.SemiExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" ).decorate

      when object.train_type == "odpt.TrainType:TokyoMetro.RapidExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToSeibu" ).decorate
      end

    elsif object.railway_line == "odpt.Railway:TokyoMetro.Fukutoshin"

      case object.train_type
      when "odpt.TrainType:TokyoMetro.SemiExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" ).decorate

      when object.train_type == "odpt.TrainType:TokyoMetro.RapidExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToSeibu" ).decorate

      when object.train_type == "odpt.TrainType:TokyoMetro.CommuterLimitedExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToTokyu" ).decorate

      when object.train_type == "odpt.TrainType:TokyoMetro.LimitedExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.LimitedExpress.ToTokyu" ).decorate
      end

    end

    raise "Error: train_type_in_api: \"#{ object.train_type }\" / railway_line: \"#{ object.railway_line }\""
  end

  def starting_station_decorated
    ::Station::Info.find_by( same_as: object.starting_station ).decorate.train_location
  end

  def terminal_station_decorated
    ::Station::Info.find_by( same_as: object.terminal_station ).decorate.train_location
  end
  
  def train_type
    ::TrainType.find_by( train_type_in_api_id: train_type_in_api_id , railway_line_id: railway_line_id )
  end

  def train_type_in_api
    ::TrainTypeInApi.find_by( same_as: object.train_type )
  end

  def train_type_in_api_id
    train_type_in_api.id
  end

  def railway_line_in_db
    ::RailwayLine.find_by( same_as: object.railway_line )
  end

  def railway_line_id
    railway_line_in_db.id
  end

end