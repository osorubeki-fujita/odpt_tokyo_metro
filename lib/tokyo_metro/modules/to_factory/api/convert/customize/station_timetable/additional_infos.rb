module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationTimetable::AdditionalInfos

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::StationTimetable::List.class_eval do
      include ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationTimetable::AdditionalInfos::Generate::List
    end
  end

end
