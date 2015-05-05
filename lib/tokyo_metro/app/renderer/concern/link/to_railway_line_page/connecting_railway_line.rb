class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::FromStationFacilityPage

  private

  def to_render?
    railway_line_object.not_operated_yet?
  end

  def url
    @railway_line_decorated.url
  end

  def valid_railway_line_decorator_class?
    @railway_line_decorated.instance_of?( ::ConnectingRailwayLineDecorator )
  end

  def additional_info_to_display
    if object.connecting_to_another_station?
      ::Proc.new {
        h.render inline: <<-HAML , type: :haml , locals: { connecting_station_info: object.connecting_station_info }
= connecting_station_info.decorate.render_connection_info_from_another_station
        HAML
      }
    else
      nil
    end
  end

end