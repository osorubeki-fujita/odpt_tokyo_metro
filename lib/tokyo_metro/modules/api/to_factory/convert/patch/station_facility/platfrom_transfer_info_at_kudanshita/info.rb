module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::PlatformTransferInfoAtKudanshita::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::PlatformTransferInfoAtKudanshita::Info.process( self )
  end

end
