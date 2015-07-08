class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NambokuLineToMusashiKosugi::Info < TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStationsVerTwo::Info

  def initialize( object )
    super( object , ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NambokuLineToMusashiKosugi::Info::TrainTime::Info )
  end

  private

  def to_process?
    @object.namboku_line?
  end

end
