class TokyoMetro::Factory::BeforeSeed::Api::StationTimetable::Info::TrainTime::Info::TrainType::Pattern < TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainType::Pattern

  def initialize( *args , station_info_id )
    super( *args )
    @station_info_id = station_info_id
  end

  def match?( *args , station_info_id )
    super( *args ) and station_is?( station_info_id )
  end

  private

  def station_is?( station_info_id )
    @station_info_id == station_info_id
  end

end
