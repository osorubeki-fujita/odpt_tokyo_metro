module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainLocation::ChiyodaMainLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainLocation::ChiyodaMainLine::Info.process( self )
  end

end
