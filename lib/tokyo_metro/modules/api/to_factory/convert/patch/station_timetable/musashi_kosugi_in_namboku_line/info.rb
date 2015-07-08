module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MusashiKosugiInNambokuLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NambokuLineToMusashiKosugi::Info.process( self )
  end

end
