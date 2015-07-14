module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationTimetable::ChiyodaBranchLine

  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationTimetable::ChiyodaBranchLine::Info
    end
  end

end
