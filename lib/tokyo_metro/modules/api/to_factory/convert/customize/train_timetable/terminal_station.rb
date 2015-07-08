module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::TerminalStation

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::TerminalStation::Info
    end
  end

end
