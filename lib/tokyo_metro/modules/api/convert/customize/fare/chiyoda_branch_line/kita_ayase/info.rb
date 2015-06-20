module TokyoMetro::Modules::Api::Convert::Customize::Fare::ChiyodaBranchLine::KitaAyase::Info

  def initialize( *variables )
    super( *variables )
    convert_infos_related_to_kita_ayase
  end

  private

  def convert_infos_related_to_kita_ayase
    ::TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::KitaAyase::Info.process( self )
  end

end
