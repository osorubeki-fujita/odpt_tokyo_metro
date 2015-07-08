class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::FukutoshinLineForWakoshi::Info < TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info

  def initialize( object )
    super( object , ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::FukutoshinLineForWakoshi::Info::TrainTime::Info )
  end

  private

  def to_process?
    @object.fukutoshin_line? and @object.between_wakoshi_and_kotake_mukaihara?
  end

end
