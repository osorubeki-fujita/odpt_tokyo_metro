module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::StartingStation

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::StartingStation::Info
    end
  end

end
