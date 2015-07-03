module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MusashiKosugiInNambokuLine

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MusashiKosugiInNambokuLine::Info
    end
  end

end
