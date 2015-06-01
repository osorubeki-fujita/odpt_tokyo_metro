class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::ConnectingRailwayLine::FromStationFacilityPage < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::ConnectingRailwayLine::MetaClass

  def initialize( request , connecting_railway_line_decorated )
    @display_another_station_info = true
    @display_additional_info = false
    super( request , connecting_railway_line_decorated )
  end

end
