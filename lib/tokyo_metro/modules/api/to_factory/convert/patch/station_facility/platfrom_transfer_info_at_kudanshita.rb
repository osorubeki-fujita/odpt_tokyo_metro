module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::PlatformTransferInfoAtKudanshita

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::PlatformTransferInfoAtKudanshita::Info
    end
  end

end
