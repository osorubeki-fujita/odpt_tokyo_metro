class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::FukutoshinLineForWakoshi::Info::TrainTime::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::TerminalStation::Info

  def initialize( object )
    super( object )
    @invalid_terminal_station , @valid_terminal_station = ::TokyoMetro::Modules::Dictionary::Common::Station::StringList.wakoshi
  end

  private

  def to_process?
    @object.terminal_station == @invalid_terminal_station
  end

  def station_name_new
    @valid_terminal_station
  end

end
