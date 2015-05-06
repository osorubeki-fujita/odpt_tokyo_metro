class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromRailwayLinePage < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::MetaClass

  def initialize( request , connecting_railway_line_decorated )
    @display_another_station_info = true
    @display_additional_info = true
    super( request , connecting_railway_line_decorated )
  end

  def li_classes
    ary = super()
    if connecting_railway_line_object.not_recommended?
      ary << :not_recommended
    end
    if connecting_railway_line_object.cleared?
      ary << :cleared
    end
    ary
  end

end