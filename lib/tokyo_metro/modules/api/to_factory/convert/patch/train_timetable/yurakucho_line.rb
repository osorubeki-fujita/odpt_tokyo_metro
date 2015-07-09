module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::YurakuchoLine

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::TrainTimetable::List.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::YurakuchoLine::Generate::List
    end
  end

end
