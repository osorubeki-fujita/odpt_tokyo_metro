class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::FromStationFacilityPage

  def initialize( request , connecting_railway_line_decorated , display_additional_infos: false )
    @connecting_railway_line_decorated = connecting_railway_line_decorated
    @display_additional_infos = display_additional_infos

    railway_line_decorated = connecting_railway_line_decorated.railway_line.decorate

    super( request , railway_line_decorated )
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

  def li_classes
    ary = super()
    if object.not_recommended?
      ary << :not_recommended
    end
    if object.cleared?
      ary << :cleared
    end
    ary
  end

end