class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::YurakuchoAndFukutoshinLine::Top::ToSeibuIkebukuroLine < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation::EachType

  def initialize( request )
    super( request )

    @from_station = ::Station::Info.find_by( same_as: "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara" )
    # @from_station = ::Station::Info.find_by( same_as: "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara" )

    @direction = [
      ::Station::Info.find_by( same_as: "odpt.Station:Seibu.SeibuYurakucho.Nerima" ) ,
      ::Station::Info.find_by( same_as: "odpt.Station:Seibu.Ikebukuro.Tokorozawa" )
    ]

    @railway_line_and_terminal_station_info = ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation::EachType::RailwayLineAndTerminalStation.new(
      @request ,
      ::Railway::Line::Info.find_by( same_as: "odpt.Railway:Seibu.Ikebukuro" ) ,
      ::Station::Info.find_by( same_as: "odpt.Station:Seibu.Ikebukuro.Hanno" )
    )
  end

end
