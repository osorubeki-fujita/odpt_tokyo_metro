module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::RomanceCar

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::RomanceCar::Info
    end
  end

end
