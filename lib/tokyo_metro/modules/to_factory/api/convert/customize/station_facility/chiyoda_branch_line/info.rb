module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::ChiyodaBranchLine::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::ChiyodaBranchLine::Info.process( self )
  end

end
