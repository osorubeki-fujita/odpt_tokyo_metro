class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::FromStationFacilityPage < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass

  def initialize( request , railway_line_decorated )
    super( request , railway_line_decorated )
    @controller = :railway_line
    @link_type = :standard
  end

  private

  def li_classes
    ary = super()
    ary << :connection
    if railway_line_object.railway_line.tokyo_metro?
      ary << :tokyo_metro
    else
      ary << :other_operators
    end
    ary
  end

end