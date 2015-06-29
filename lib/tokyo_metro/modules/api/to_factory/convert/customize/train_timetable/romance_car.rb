module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::RomanceCar

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainInfos::RomanceCar::Info
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::RomanceCar::Info
    end
  end

end
