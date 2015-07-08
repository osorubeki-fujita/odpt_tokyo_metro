module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainLocation::MusashiKosugiInNambokuLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainLocation::NambokuLineFromMusashiKosugi::Info.process( self )
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainLocation::NambokuLineToMusashiKosugi::Info.process( self )
  end

end
