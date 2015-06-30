class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ToeiMitaLine::Info < TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::ToeiMitaLine::Info

  def process
    convert_station_name
    super
  end

  private

  def convert_station_name
    TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info.process(
      object ,
      ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Dictionary::RegexpForReplace.namboku_and_toei_mita_line_common_stations ,
      "Toei.Mita"
    )
  end

end
