class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info < TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info

  def initialize( object )
    super( object , ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info::TrainTime::Info )
  end

  private

  def to_process?
    @object.marunouchi_line_including_branch? and @object.between_honancho_and_nakano_shimbashi_including_invalid?
  end

end
