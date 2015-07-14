module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::RailwayLine::ChiyodaBranchLine

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::RailwayLine::List.class_eval do
      include ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::RailwayLine::ChiyodaBranchLine::Generate::List
    end
  end

end
