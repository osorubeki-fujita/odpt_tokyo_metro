module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::AdditionalInfos

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::StationTimetable::List.class_eval do
      include ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::AdditionalInfos::Generate::List
    end
  end

end
