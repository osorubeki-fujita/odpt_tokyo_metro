module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MusashiKosugiInNambokuLine::Info

  def initialize( *variables )
    super( *variables )
    convert_terminal_station_of_namboku_line_train_for_musashi_kosugi
  end

  private

  def convert_terminal_station_of_namboku_line_train_for_musashi_kosugi
    if namboku_line?
      ::TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info.process( self , :convert_terminal_station_to_musashi_kosugi_in_tokyu_meguro_line )
    end
  end

end
