module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::TrainLocation::ChiyodaMainLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patches::TrainLocation::ChiyodaMainLine::Info
    end
  end

end
