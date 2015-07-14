module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine::Info

  # Constructor
  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.process( self )
  end

end
