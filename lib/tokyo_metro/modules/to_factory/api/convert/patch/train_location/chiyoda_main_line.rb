module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainLocation::ChiyodaMainLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainLocation::ChiyodaMainLine::Info
    end
  end

end
