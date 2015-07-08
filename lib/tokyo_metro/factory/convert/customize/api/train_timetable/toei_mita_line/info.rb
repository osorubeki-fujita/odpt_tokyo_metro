class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ToeiMitaLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::ToeiMitaLine::Info

  def process
    convert_station_name
    convert_operator
    super
  end

  private

  def convert_operator
    object.instance_variable_set( :@operator , "odpt.Operator:Toei" )
  end

  def convert_station_name
    TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info.process(
      object ,
      ::TokyoMetro::Factory::Convert::Dictionary::RegexpForReplace.namboku_and_toei_mita_line_common_stations ,
      "Toei.Mita"
    )
  end

end
