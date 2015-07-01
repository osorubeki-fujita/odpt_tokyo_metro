module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ChiyodaBranchLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainInfos::ChiyodaBranchLine::Info
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ChiyodaBranchLine::Info
    end
  end

end
