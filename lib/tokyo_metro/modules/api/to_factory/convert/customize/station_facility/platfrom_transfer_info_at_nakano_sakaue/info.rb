module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info.process( self )
  end

end
