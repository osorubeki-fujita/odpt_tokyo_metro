module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::ChiyodaBranchLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::ChiyodaBranchLine::Info
    end
  end

end
