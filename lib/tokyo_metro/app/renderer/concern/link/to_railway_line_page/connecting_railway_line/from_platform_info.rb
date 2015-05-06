class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromPlatfromInfo < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromRailwayLinePage

  def initialize( request , platform_transfer_info_decorated )
    @platform_transfer_info_decorated = platform_transfer_info_decorated
    connecting_railway_line_decorated = platform_transfer_info_decorated
    super( request , connecting_railway_line_decorated )
    @display_another_station_info = false
  end

  private

  def object
    @platform_transfer_info_decorated.object
  end

  def connecting_railway_line_object
    @connecting_railway_line_decorated.object
  end
  
  def optional_info_to_display
    nil
  end

  def li_classes
    [ [ :transfer_info ] + super() ].flatten - [ :cleared ]
  end

end