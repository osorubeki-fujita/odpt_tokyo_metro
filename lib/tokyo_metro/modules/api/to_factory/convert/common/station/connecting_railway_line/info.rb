# @note
#   This module is included
#     to {TokyoMetro::Api::Station::Info}
#     by {TokyoMetro::Modules::Api::ToFactory::Convert::Common::Station::ConnectingRailwayLine.set_modules} .
module TokyoMetro::Modules::Api::ToFactory::Convert::Common::Station::ConnectingRailwayLine::Info

  private

  def convert_and_delete_connecting_railway_lines( replacing: nil , ignored: nil )
    ::TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info.updated( self , replacing: replacing , ignored: ignored )
  end

end
