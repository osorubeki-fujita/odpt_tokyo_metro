module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ReplaceStationName

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ReplaceStationName::Info
    end
  end

end