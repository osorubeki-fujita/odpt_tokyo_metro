module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::TerminalStation::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::TerminalStation::Info.process( self )
  end

end
