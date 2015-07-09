class TokyoMetro::Factory::BeforeSeed::Api::TrainTimetable::Info::TrainType::Pattern < TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainType::Pattern

  def initialize( *args , starting_station_info_id )
    super( *args )
    @starting_station_info_id = starting_station_info_id
  end

  def match?( *args , starting_station_info_id )
    super( *args ) and starting_station_is?( starting_station_info_id )
  end

  private

  def starting_station_is?( starting_station_info_id )
    @starting_station_info_id == starting_station_info_id
  end

end
