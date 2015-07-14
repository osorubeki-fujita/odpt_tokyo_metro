module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::MarunouchiBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::MarunouchiBranchLine::Info.process( self )
  end

end
