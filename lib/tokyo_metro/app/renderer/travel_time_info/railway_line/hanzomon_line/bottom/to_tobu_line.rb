class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::HanzomonLine::Bottom::ToTobuLine < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation::EachType

  def initialize( request )
    super( request )

    @direction = [
      ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Skytree.KitaSenju" ) ,
      ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Skytree.Koshigaya" ) ,
      ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Skytree.Kasukabe" ) ,
      ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Skytree.TobuDobutsuKoen" )
    ]
    @via = ::Railway::Line::Info.find_by( same_as: "odpt.Railway:Tobu.Skytree" )
    @railway_line_and_terminal_station_info = [
      ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation::EachType::RailwayLineAndTerminalStation.new(
        @request ,
        ::Railway::Line::Info.find_by( same_as: "odpt.Railway:Tobu.Isesaki" ) ,
        ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Isesaki.Kuki" )
      ) ,
      ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation::EachType::RailwayLineAndTerminalStation.new(
        @request ,
        ::Railway::Line::Info.find_by( same_as: "odpt.Railway:Tobu.Nikko" ) ,
        ::Station::Info.find_by( same_as: "odpt.Station:Tobu.Nikko.MinamiKurihashi" )
      )
    ]
  end

end
