module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::CurrentStation

  include ::TokyoMetro::Modules::Decision::Common::Station::Current

  private

  def station_same_as__is_in?( *variables )
    super( *variables , @stations_in_db.map( &:same_as ) )
  end

end