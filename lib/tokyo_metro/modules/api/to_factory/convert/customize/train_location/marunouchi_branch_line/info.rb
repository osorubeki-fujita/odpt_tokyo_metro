module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::MarunouchiBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::MarunouchiBranchLine::Info.process( self )
  end

end
