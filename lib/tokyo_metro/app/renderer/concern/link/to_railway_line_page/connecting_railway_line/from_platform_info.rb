class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromPlatfromInfo < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromRailwayLinePage

  def initialize( request , platform_transfer_info_decorated )
    @platform_transfer_info_decorated = platform_transfer_info_decorated
    super( request , connecting_railway_line_info_in_initialize.decorate )
    @display_another_station_info = false
  end

  def render
    if to_render?
      h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: li_classes }
  - if url.present?
    = link_to_unless( request.fullpath == url , "" , url )
  %div{ class: div_classes }
    = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
    %div{ class: :railway_line }
      = railway_line_decorated.render_name_in_station_facility_platform_info_transfer_info
      - if railway_direction.present?
        = railway_direction.decorate.render_in_station_facility_platform_info_transfer_info
      %p{ class: [ :time , :text_en ] , min: necessary_time }<
        = necessary_time
      HAML
    end
  end

  private

  def object
    @platform_transfer_info_decorated.object
  end
  
  def optional_info_to_display
    nil
  end

  def li_classes
    [ [ :transfer_info ] + super() ].flatten - [ :cleared ]
  end

  def h_locals
    super().merge({
      railway_direction: @platform_transfer_info_decorated.railway_direction ,
      necessary_time: @platform_transfer_info_decorated.necessary_time
    })
  end

  def connecting_railway_line_info_in_initialize
    station_facility_platform_info = object.station_facility_platform_info
    station_infos = station_facility_platform_info.station_facility.station_infos

    railway_line_of_this_station = ::RailwayLine.find( station_facility_platform_info.railway_line_id )
    railway_line_connected = ::RailwayLine.find( object.railway_line_id )

    station_info = station_infos.find_by( railway_line: railway_line_of_this_station )

    if railway_line_connected.same_as == "odpt.Railway:JR-East"
      puts "station info: #{ station_info.same_as }"
      puts "railway line of this station: #{ railway_line_of_this_station.same_as }"
      puts "railway line connected: #{ railway_line_connected.same_as }"
      railway_line_connected
    else
      connecting_railway_line_info = station_info.connecting_railway_lines.find_by( railway_line: railway_line_connected )
      unless connecting_railway_line_info.present?
        puts "station info: #{ station_info.same_as }"
        puts "railway line of this station: #{ railway_line_of_this_station.same_as }"
        puts "railway line connected: #{ railway_line_connected.same_as }"
      end
      connecting_railway_line_info
    end
  end

  def valid_railway_line_decorator_class?
    super or connected_to_jr_lines?
  end

end