module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::RomanceCar

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::RomanceCar::Info
    end
  end

end
