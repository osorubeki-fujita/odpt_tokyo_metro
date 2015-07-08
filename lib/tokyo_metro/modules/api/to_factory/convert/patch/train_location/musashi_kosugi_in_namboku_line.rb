module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainLocation::MusashiKosugiInNambokuLine

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainLocation::MusashiKosugiInNambokuLine::Info
    end
  end

end
