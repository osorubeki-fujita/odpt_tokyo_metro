class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::MajorTerminalStation

  EXCEPTIONS = [ "odpt.Station:Toei.Mita.NishiTakashimadaira" ]

  def initialize( station_train_times , terminal_station_infos )
    @station_train_times = station_train_times
    @terminal_station_infos = terminal_station_infos
    @major_terminal_station_info_id = ( terminal_station_infos.pluck( :id ) - exception_ids ).max { | terminal_station_info_id_1 , terminal_station_info_id_2 |
      number_of_trains_for( terminal_station_info_id_1 ) <=> number_of_trains_for( terminal_station_info_id_2 )
    }
  end

  def id
    @major_terminal_station_info_id
  end

  def in_db
    @terminal_station_infos.find( @major_terminal_station_info_id )
  end

  private

  def exception_ids
    ::Station::Info.where( same_as: EXCEPTIONS ).pluck( :id )
  end

  def number_of_trains_for( station_info_id )
    @station_train_times.count { | station_train_time | station_train_time.terminal_station_info_id == station_info_id }
  end

end
