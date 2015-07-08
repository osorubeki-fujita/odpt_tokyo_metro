module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::MarunouchiBranchLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::MarunouchiBranchLine::Info
    end
  end

end
