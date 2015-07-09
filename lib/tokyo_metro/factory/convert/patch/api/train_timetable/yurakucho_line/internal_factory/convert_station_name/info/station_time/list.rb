class TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ConvertStationName::Info::StationTime::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  def process
    convert_station_names
  end

  private

  def convert_station_names
    @object.each do | item |
      ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ConvertStationName::Info::StationTime::Info.process( item )
    end
  end

end
