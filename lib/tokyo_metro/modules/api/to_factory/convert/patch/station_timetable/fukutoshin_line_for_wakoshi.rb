module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::FukutoshinLineForWakoshi

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::FukutoshinLineForWakoshi::Info
    end
  end

end
