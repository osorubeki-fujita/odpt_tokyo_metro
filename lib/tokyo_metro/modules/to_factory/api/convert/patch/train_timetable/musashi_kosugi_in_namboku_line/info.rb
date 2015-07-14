module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::MusashiKosugiInNambokuLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::NambokuLineFromMusashiKosugi::Info.process( self )
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::NambokuLineToMusashiKosugi::Info.process( self )
  end

end
