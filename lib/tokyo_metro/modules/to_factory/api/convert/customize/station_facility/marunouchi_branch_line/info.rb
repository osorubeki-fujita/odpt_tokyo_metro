module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::MarunouchiBranchLine::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::MarunouchiBranchLine::Info.process( self )
  end

end
