class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , station_info , railway_line , station_timetables )
    super( request )
    @station_info = station_info
    @railway_line = railway_line
    @station_timetables = station_timetables
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- grouped_by_direction.each do | station_timetables_of_each_railway_direction |
  = station_timetables_of_each_railway_direction.render
    HAML
  end

  private

  def grouped_by_direction
    h = ::Hash.new
    _railway_direction_ids = railway_direction_ids
    @station_timetables.each do | station_timetable |
      d_ids = station_timetable.station_timetable_fundamental_infos.pluck( :railway_direction_id )
      d_ids.each do | railway_direction_id |
        if h[ railway_direction_id ].nil?
          h[ railway_direction_id ] = ::Array.new
        end
        h[ railway_direction_id ] << station_timetable
      end
    end

    h.sort_keys.map { | railway_direction_id , station_timetables |
      ::TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection.new(
        request ,
        @station_info ,
        @railway_line ,
        ::RailwayDirection.find( railway_direction_id ) ,
        station_timetables
      )
    }
  end

  def railway_direction_ids
    @station_timetables.map { | station_timetable |
      station_timetable.railway_directions.pluck( :id )
    }.flatten.uniq.sort
  end

  def h_locals
    super.merge({
      grouped_by_direction: grouped_by_direction
    })
  end

end