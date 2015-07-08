module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::MusashiKosugiInNambokuLine

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::MusashiKosugiInNambokuLine::Info
    end
  end

end
