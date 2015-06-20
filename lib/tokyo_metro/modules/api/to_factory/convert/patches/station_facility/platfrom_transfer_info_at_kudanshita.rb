module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::PlatformTransferInfoAtKudanshita

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::PlatformTransferInfoAtKudanshita::Info
    end
  end

end
