class TokyoMetro::App::Renderer::StationTimetable::Group < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , station_info , station_timetables )
    super( request )
    @station_info = station_info
    @station_timetables = station_timetables
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- grouped_by_railway_line.each do | station_timetables_of_each_railway_line |
  = station_timetables_of_each_railway_line.render
    HAML
  end

  private

  def grouped_by_railway_line
    h = ::Hash.new
    _railway_line_info_ids = railway_line_info_ids
    @station_timetables.each do | station_timetable |
      r_ids = station_timetable.station_timetable_fundamental_infos.pluck( :railway_line_info_id )
      r_ids.each do | railway_line_info_id |
        if h[ railway_line_info_id ].nil?
          h[ railway_line_info_id ] = ::Array.new
        end
        h[ railway_line_info_id ] << station_timetable
      end
    end
    h.sort_keys.map { | railway_line_info_id , station_timetables |
      ::TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine.new(
        request ,
        @station_info ,
        ::Railway::Line.find( railway_line_info_id ) ,
        station_timetables
      )
    }
  end

  def railway_line_info_ids
    @station_timetables.map { | station_timetable |
      station_timetable.railway_line_infos.pluck( :id )
    }.flatten.uniq.sort
  end

  def h_locals
    super.merge({
      grouped_by_railway_line: grouped_by_railway_line
    })
  end

end
