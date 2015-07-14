module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ChiyodaBranchLine::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Customize::Api::Station::ChiyodaBranchLine::Generate::List.updated( ary )
  end

end
