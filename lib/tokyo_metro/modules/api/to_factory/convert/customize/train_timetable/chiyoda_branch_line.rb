module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ChiyodaBranchLine

  def self.set_modules
    ::TokyoMetro::Api::TrainTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainInfos::ChiyodaBranchLine::Info
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ChiyodaBranchLine::Info
    end
  end

end
