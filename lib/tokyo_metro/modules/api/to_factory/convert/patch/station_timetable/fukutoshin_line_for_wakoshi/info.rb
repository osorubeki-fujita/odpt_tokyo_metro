module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::FukutoshinLineForWakoshi::Info

  def initialize( *args )
    super( *args )
    convert_terminal_stations_of_fukutoshin_line_for_wakoshi
  end

  private

  def convert_terminal_stations_of_fukutoshin_line_for_wakoshi
    if fukutoshin_line? and between_wakoshi_and_kotake_mukaihara?
      ::TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info.process( self , :convert_terminal_station_to_wakoshi_in_fukutoshin_line )
    end
  end

end
