module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::RailwayLine::ChiyodaBranchLine::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Customize::Api::RailwayLine::ChiyodaBranchLine::Generate::List.updated( ary )
  end

end
