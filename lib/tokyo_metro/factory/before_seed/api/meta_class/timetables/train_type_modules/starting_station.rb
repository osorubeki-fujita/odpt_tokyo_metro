module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::StartingStation

  include ::TokyoMetro::Modules::Decision::Common::StartingStation

  private

  def starting?( regexp )
    super( regexp , @starting_station_info_in_db.same_as )
  end

  alias :is_starting? :starting?
  alias :start? :starting?

end
