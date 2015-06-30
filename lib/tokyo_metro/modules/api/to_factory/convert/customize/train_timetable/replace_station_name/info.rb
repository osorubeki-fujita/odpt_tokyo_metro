module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ReplaceStationName::Info

  private

  def replace_station_name( regexp_for_replaced_station , replacing_string )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info.process( self , regexp_for_replaced_station , replacing_string )
  end

end
