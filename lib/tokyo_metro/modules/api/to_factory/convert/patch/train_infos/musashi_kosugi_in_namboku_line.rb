module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine::Methods::Info
    end

    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine::Methods::Info
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine::Initializer::Info
    end

    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine::Methods::Info
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainInfos::MusashiKosugiInNambokuLine::Initializer::Info
    end
  end

end
