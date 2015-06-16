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
      terminal_station_decorated: terminal_station_decorated ,
      train_owner_decorated: train_owner_decorated ,
      to_render_train_type: render_train_type? ,
      to_render_train_owner: render_train_owner?
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%li{ class: [ :train_location , this.railway_line.css_class_name , :clearfix ] , id: this.object.train_number.downcase }
  %div{ class: :train_fundamental_infos }
    = this.railway_line.decorate.render_matrix( make_link_to_railway_line: false , size: :very_small )
    - if to_render_train_type
      = train_type_decorated.render_in_train_location
    = terminal_station_decorated.render_as_terminal_station
  = this.render_current_position
  %ul{ class: :sub_infos }
    = this.render_delay
    = this.render_train_number
    = starting_station_decorated.render_as_starting_station
    - if to_render_train_owner
      = train_owner_decorated.in_train_location.render
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

  def render_train_number
    str = object.train_number
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%li{ class: [ :train_number , :sub_info , :clearfix ] }
  %div{ class: :title_of_train_number }
    %p{ class: :text_ja }<
      = "列車番号"
    %p{ class: :text_en }<
      = "Train number "
  %div{ class: [ :train_number_text , :text_en ] }<
    = str
    HAML
  end

  private

  def not_render_train_type?
    ( on_ginza_line? or on_marunouchi_line? or on_marunouchi_branch_line? or on_hibiya_line? ) and local_train?
  end

  def not_render_train_owner?
    on_ginza_line? or on_marunouchi_line? or on_marunouchi_branch_line?
  end

  def local_train?
    object.train_type == "odpt.TrainType:TokyoMetro.Local"
  end
  
  [ :train_type , :train_owner ].each do | method_basename |
    eval <<-DEF
      def render_#{ method_basename }?
        !( not_render_#{ method_basename }? )
      end
    DEF
  end
  
  [ :ginza , :marunouchi , :marunouchi_branch , :hibiya ].each do | method_basename |
    eval <<-DEF
      def on_#{ method_basename }_line?
        @railway_line.same_as == "odpt.Railway:TokyoMetro.#{ method_basename.camelize }"
      end
    DEF
  end

  [ :starting_station , :terminal_station ].each do | method_basename |
    eval <<-DEF
      def #{ method_basename }_decorated
        ::Station::Info.find_by( same_as: object.#{ method_basename } ).decorate.train_location
      end
    DEF
  end

  def train_type
    t = ::TrainType.find_by( train_type_in_api_id: train_type_in_api_id , railway_line_id: railway_line_id )
    if t.present?
      return t
    end

    case object.railway_line
    when "odpt.Railway:TokyoMetro.Chiyoda"

      if object.train_type == "odpt.TrainType:TokyoMetro.RomanceCar"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.Normal" )
      end

    when "odpt.Railway:TokyoMetro.Yurakucho"

      #-------- 西武

      case object.train_type
      when "odpt.TrainType:TokyoMetro.SemiExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" )

      when "odpt.TrainType:TokyoMetro.Rapid"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Rapid.ToSeibu" )

      when "odpt.TrainType:TokyoMetro.RapidExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.RapidExpress.ToSeibu" )
      end

    when "odpt.Railway:TokyoMetro.Fukutoshin"

      case object.train_type

      #-------- 西武

      when "odpt.TrainType:TokyoMetro.SemiExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" )

      when "odpt.TrainType:TokyoMetro.Rapid"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Rapid.ToSeibu" )
        

      when "odpt.TrainType:TokyoMetro.RapidExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.RapidExpress.ToSeibu" )

      #-------- 東急

      when "odpt.TrainType:TokyoMetro.CommuterLimitedExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToTokyu" )

      when "odpt.TrainType:TokyoMetro.LimitedExpress"
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.LimitedExpress.ToTokyu" )
      end

    end

    raise "Error: train_type_in_api: \"#{ object.train_type }\" / railway_line: \"#{ object.railway_line }\""
  end

  def train_type_decorated
    train_type.decorate
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

  def train_owner_in_db
    ::TrainOwner.find_by( same_as: object.train_owner )
  end

  def train_owner_decorated
    train_owner_in_db.decorate
  end

end
