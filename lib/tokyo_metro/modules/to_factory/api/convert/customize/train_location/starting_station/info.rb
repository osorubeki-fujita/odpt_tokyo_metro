module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::StartingStation::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::StartingStation::Info.process( self )
  end

end
