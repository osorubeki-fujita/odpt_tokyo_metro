module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Fare::ChiyodaBranchLine::Ayase::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::Ayase::Generate::List.updated( ary )
  end

end
