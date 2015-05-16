class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , station_info , railway_line , railway_direction , station_timetables )
    super( request )
    @station_info = station_info
    @railway_line = railway_line
    @railway_direction = railway_direction
    @station_timetables = station_timetables
  end
  
  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- grouped_by_operation_day.each do | station_timetables_of_each_operation_day |
  = station_timetables_of_each_operation_day.render
    HAML
  end

  private

  # 方面別の時刻表（1つ）
  def station_timetable_of_a_direction
    # 【注意】@station_timetables は配列
    unless @station_timetables.length == 1
      raise "Error"
    end
    @station_timetables.first
  end

  # 方面ごとの各列車の時刻を取得
  def station_train_times
    station_timetable_of_a_direction.station_train_times.includes(
      :train_timetable ,
      train_timetable: [ :terminal_station_info , :train_type , :operation_day ]
    )
  end

  def grouped_by_operation_day
    h = ::Hash.new
    _operation_day_ids = operation_day_ids
    station_train_times.each do | station_train_time |
      operation_day_id = station_train_time.operation_day.id
      if h[ operation_day_id ].nil?
        h[ operation_day_id ] = ::Array.new
      end
      h[ operation_day_id ] << station_train_time
    end

    h.sort_keys.map { | operation_day_id , _station_train_times |
      ::TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay.new(
        request ,
        @station_info ,
        @railway_line ,
        @railway_direction ,
        ::OperationDay.find( operation_day_id ) ,
        _station_train_times
      )
    }
  end

  def operation_day_ids
    station_train_times.map { | station_train_time |
      station_train_time.operation_day.id
    }.flatten.uniq.sort
  end

  def h_locals
    super.merge({
      grouped_by_operation_day: grouped_by_operation_day
    })
  end

end