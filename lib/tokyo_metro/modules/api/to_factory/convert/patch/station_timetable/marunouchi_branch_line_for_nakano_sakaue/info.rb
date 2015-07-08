module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info

  def initialize( *args )
    super( *args )
    convert_terminal_stations_of_marunouchi_branch_line_for_nakano_sakaue
  end

  private

  def convert_terminal_stations_of_marunouchi_branch_line_for_nakano_sakaue
    if marunouchi_line_including_branch? and between_honancho_and_nakano_shimbashi_including_invalid?
      ::TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info.process( self , :convert_terminal_station_to_nakano_sakaue_in_marunouchi_branch_line )
    end
  end

end
