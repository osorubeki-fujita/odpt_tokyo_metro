module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Fare::ChiyodaBranchLine::KitaAyase::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::KitaAyase::Info.process( self )
  end

end
