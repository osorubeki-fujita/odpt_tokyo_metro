module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::ChiyodaBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::ChiyodaBranchLine::Info.process( self )
  end

end
