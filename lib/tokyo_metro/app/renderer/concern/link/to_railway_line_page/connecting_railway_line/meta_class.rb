class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::MetaClass < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::FromStationFacilityPage

  def initialize( request , connecting_railway_line_decorated )
    @connecting_railway_line_decorated = connecting_railway_line_decorated
    super( request , connecting_railway_line_decorated.railway_line.decorate )
  end

  private

  def object
    @connecting_railway_line_decorated.object
  end

  def to_render?
    !( @connecting_railway_line_decorated.not_operated_yet? )
  end

  def url
    @connecting_railway_line_decorated.url_for_railway_line_page
  end

  def valid_railway_line_decorator_class?
    @connecting_railway_line_decorated.instance_of?( ::ConnectingRailwayLineDecorator )
  end
  
  def connecting_to_another_station?
    object.connecting_to_another_station?
  end

  def optional_info_to_display
    if @display_another_station_info and connecting_to_another_station?
      another_station_info_to_display
    else
      nil
    end
  end

  def another_station_info_to_display
    ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: { connecting_station_info: object.connecting_station_info }
= connecting_station_info.decorate.render_connection_info_from_another_station
      HAML
    }
  end

end