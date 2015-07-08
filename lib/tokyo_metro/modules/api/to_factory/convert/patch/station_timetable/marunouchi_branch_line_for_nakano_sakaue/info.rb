module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info

  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info.process( self )
  end

end
