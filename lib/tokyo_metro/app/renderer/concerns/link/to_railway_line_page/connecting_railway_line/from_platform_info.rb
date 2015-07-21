class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::ConnectingRailwayLine::FromPlatfromInfo < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::ConnectingRailwayLine::FromRailwayLinePage

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
      = railway_line_decorated.in_platform_transfer_info.render
      - if railway_direction_decorated.present?
        = railway_direction_decorated.render_in_station_facility_platform_info_transfer_info
      %p{ class: [ :time , :text_en ] , min: necessary_time }<
        = necessary_time
    - if optional_infos_to_display.present?
      - [ optional_infos_to_display ].flatten.each do | info |
        = info.call
      HAML
    end
  end

  private

  def object
    @platform_transfer_info_decorated.object
  end

  def optional_infos_to_display
    ary = ::Array.new
    if has_additional_transfer_info_to_display?
      ary << additional_transfer_info_to_display
    end
    ary
  end

  def li_classes
    [ [ :transfer_info ] + super() ].flatten - [ :cleared ]
  end

  def h_locals
    super().merge({
      railway_direction_decorated: @platform_transfer_info_decorated.railway_direction.try( :decorate ) ,
      necessary_time: @platform_transfer_info_decorated.necessary_time
    })
  end

  def connecting_railway_line_info_in_initialize
    platform_info = object.platform_info
    station_infos = platform_info.station_facility_info.station_infos

    railway_line_for_this_platform_info = ::Railway::Line::Info.find( platform_info.railway_line_info_id )
    railway_line_connected = ::Railway::Line::Info.find( object.railway_line_info_id )

    station_info = station_infos.find_by( railway_line: railway_line_for_this_platform_info )

    if railway_line_connected.on_jr_lines?
      puts "station info: #{ station_info.same_as }"
      puts "railway line of this station: #{ railway_line_for_this_platform_info.same_as }"
      puts "railway line connected: #{ railway_line_connected.same_as }"

      r = railway_line_connected

    elsif station_info.same_as == "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue" and railway_line_connected.same_as == "odpt.Railway:TokyoMetro.Marunouchi"
      r = nil

    else
      connecting_railway_line_info = station_info.connecting_railway_line_infos.find_by( railway_line: railway_line_connected )
      unless connecting_railway_line_info.present?
        puts "station info: #{ station_info.same_as }"
        puts "railway line of this station: #{ railway_line_for_this_platform_info.same_as }"
        puts "railway line connected: #{ railway_line_connected.same_as }"
      end
      r = connecting_railway_line_info
    end

    if r.blank?
      ary = ::Array.new
      ary << "\n"
      ary << "object \[#{ object.class }\] : #{ object.id }"
      ary << "platform_info: #{ platform_info.id }"
      ary << "station_facility: #{ platform_info.station_facility_info.id }"
      ary << "station info: #{ station_info.same_as }"
      ary << "railway line for this platform info: #{ railway_line_for_this_platform_info.same_as }"
      ary << "railway line connected: #{ railway_line_connected.same_as }"
      raise ary.join( "\n" )
    end

    r
  end

  def valid_railway_line_decorator_class?
    super or connected_to_jr_lines?
  end

end
