module TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine

  def self.instance_of( request , railway_line_infos )
    railway_line_infos = [ railway_line_infos ].flatten
    case railway_line_infos.length
    when 1
      railway_line_info = railway_line_infos.first
      class_name_of_instance_for_one_railway_line( railway_line_info ).new( request , railway_line_info )
    when 2
      class_name_of_instance_for_multiple_railway_lines( railway_line_infos ).new( request , railway_line_infos )
    else
      raise "Error: \"#{ railway_line_infos.pluck( :same_as ).to_s }\" is not valid."
    end
  end

  class << self

    private

    def class_name_of_instance_for_one_railway_line( railway_line_info )
      case railway_line_info.same_as
      when "odpt.Railway:TokyoMetro.Ginza"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::GinzaLine
      when "odpt.Railway:TokyoMetro.Hibiya"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::HibiyaLine
      when "odpt.Railway:TokyoMetro.Tozai"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::TozaiLine
      when "odpt.Railway:TokyoMetro.Yurakucho"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::YurakuchoLine
      when "odpt.Railway:TokyoMetro.Hanzomon"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::HanzomonLine
      when "odpt.Railway:TokyoMetro.Namboku"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::NambokuLine
      when "odpt.Railway:TokyoMetro.Fukutoshin"
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::FukutoshinLine
      else
        raise "Error: \"#{ railway_line_info.same_as }\" is not valid."
      end
    end

    def class_name_of_instance_for_multiple_railway_lines( railway_line_infos )
      railway_line_infos_same_as = railway_line_infos.to_a.map( &:same_as ).sort
      case railway_line_infos_same_as
      when [ "odpt.Railway:TokyoMetro.Marunouchi" , "odpt.Railway:TokyoMetro.MarunouchiBranch" ].sort
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::MarunouchiLine
      when [ "odpt.Railway:TokyoMetro.Chiyoda" , "odpt.Railway:TokyoMetro.ChiyodaBranch" ].sort
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine
      when [ "odpt.Railway:TokyoMetro.Yurakucho" , "odpt.Railway:TokyoMetro.Fukutoshin" ].sort
        ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::YurakuchoAndFukutoshinLine
      else
        raise "Error: \"#{ railway_line_infos_same_as.to_s }\" is not valid."
      end
    end

  end

end
