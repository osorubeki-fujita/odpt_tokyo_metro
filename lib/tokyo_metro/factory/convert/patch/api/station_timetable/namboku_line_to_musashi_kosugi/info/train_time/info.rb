class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NambokuLineToMusashiKosugi::Info::TrainTime::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::NambokuLineToMusashiKosugi::Info

  def to_process?
    @object.terminal_station == "odpt.Station:Tokyu.Toyoko.MusashiKosugi"
  end

end
