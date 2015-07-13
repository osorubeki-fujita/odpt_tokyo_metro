class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::MajorTerminalStation

  EXCEPTIONS = [ "odpt.Station:Toei.Mita.NishiTakashimadaira" ]

  def initialize( station_train_times , terminal_station_info_ids )
    exception_ids = ::Station::Info.where( same_as: EXCEPTIONS ).pluck( :id )
    @terminal_station_id = ( terminal_station_info_ids - exception_ids ).max { | terminal_station_info_id_1 , terminal_station_info_id_2 |
      number_of_trains_for( station_train_times , terminal_station_info_id_1 ) <=> number_of_trains_for( station_train_times , terminal_station_info_id_2 )
    }
  end
  
  attr_reader :terminal_station_id

  private

  def number_of_trains_for( station_train_times , station_info_id )
    station_train_times.count { | station_train_time | station_train_time.terminal_station_info_id == station_info_id }
  end

end
