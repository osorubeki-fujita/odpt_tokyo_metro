# @note
#   This module is prepended
#     to {TokyoMetro::Api::Station::Info}
#     by {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::Station::ConnectingRailwayLine.set_modules} .
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::Station::ConnectingRailwayLine::Info

  # Constructor
  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::Station::ConnectingRailwayLine::Info.process( self )
  end

end
