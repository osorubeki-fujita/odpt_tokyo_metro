class TokyoMetro::Api::StationTimetable::Info::TrainTime::Info::Note::ConnectionInfo

  def initialize( station , connection )
    @station = station
    @connection = connection
  end
  attr_reader :station , :connection

  def seed_and_get_id( railway_line_info_ids )
    station_info_in_db = ::Station::Info.find_by( name_ja: @station , railway_line_info_id: railway_line_info_ids )
    connection_info_h = {
      station_info_id: station_info_in_db.id ,
      connection: @connection ,
      note: self.to_s
    }
    ::StationTimetableConnectionInfo.find_or_create_by( connection_info_h ).id
    # ::TrainTimetableConnectionInfo.find_or_create_by( connection_info_h ).id
  end

  def to_s
    ""
  end

end
