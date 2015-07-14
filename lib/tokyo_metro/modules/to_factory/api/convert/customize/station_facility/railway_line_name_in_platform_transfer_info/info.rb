# @note
#   This module is included
#     to {TokyoMetro::Api::StationFacility::Info}
#     by {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfos.set_modules} .
module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfos::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos::Info.process( self )
  end

end
