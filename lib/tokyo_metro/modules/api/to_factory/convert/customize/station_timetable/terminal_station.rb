module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::TerminalStation

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::TerminalStation::Info::TrainTime::Info
    end
  end

end
