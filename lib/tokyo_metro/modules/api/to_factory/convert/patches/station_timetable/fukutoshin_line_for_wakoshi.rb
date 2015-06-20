module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationTimetable::FukutoshinLineForWakoshi

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationTimetable::FukutoshinLineForWakoshi::Info
    end

    ::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationTimetable::FukutoshinLineForWakoshi::Info::TrainTime::Info
    end
  end

end
