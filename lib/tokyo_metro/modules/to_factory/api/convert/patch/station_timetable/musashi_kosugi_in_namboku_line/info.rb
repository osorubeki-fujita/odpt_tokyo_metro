module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::MusashiKosugiInNambokuLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NambokuLineToMusashiKosugi::Info.process( self )
  end

end
