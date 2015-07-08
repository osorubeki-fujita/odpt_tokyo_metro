class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::NambokuLineToMusashiKosugi::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::TerminalStation::Info

  private

  def to_process?
    @object.namboku_line? and @object.terminal_station == "odpt.Station:Tokyu.Toyoko.MusashiKosugi"
  end

  def station_name_new
    "odpt.Station:Tokyu.Meguro.MusashiKosugi"
  end

end
