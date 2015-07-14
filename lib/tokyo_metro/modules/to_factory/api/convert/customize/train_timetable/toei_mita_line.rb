module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::ToeiMitaLine

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::ToeiMitaLine::Info
    end
  end

end
