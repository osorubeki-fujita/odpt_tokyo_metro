module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MarunouchiBranchLineForNakanoSakaue

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info
    end

    ::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::MarunouchiBranchLineForNakanoSakaue::Info::TrainTime::Info
    end
  end

end
