module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::RomanceCar

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainLocation::RomanceCar::Info
    end
  end

end
