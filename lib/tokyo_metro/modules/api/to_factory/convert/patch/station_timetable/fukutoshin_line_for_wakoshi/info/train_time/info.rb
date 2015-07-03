module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::FukutoshinLineForWakoshi::Info::TrainTime::Info

  def convert_terminal_station_to_wakoshi_in_fukutoshin_line
    convert_terminal_station( *( ::TokyoMetro::Modules::Common::Dictionary::Station::StringList.wakoshi ) )
  end

end
