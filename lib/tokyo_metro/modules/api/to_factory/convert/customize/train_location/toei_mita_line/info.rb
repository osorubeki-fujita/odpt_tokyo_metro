module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ToeiMitaLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::ToeiMitaLine::Info.process( self )
  end

end
