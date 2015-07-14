module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::StartingStation

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::StartingStation::Info
    end
  end

end
