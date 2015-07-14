module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::MusashiKosugiInNambokuLine

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::MusashiKosugiInNambokuLine::Info
    end
  end

end
