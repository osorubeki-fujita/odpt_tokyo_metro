module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::YurakuchoLine

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::TrainTimetable::List.class_eval do
      include ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::YurakuchoLine::Generate::List
    end
  end

end
