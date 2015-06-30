module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ToeiMitaLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ToeiMitaLine::Info
    end
  end

end
