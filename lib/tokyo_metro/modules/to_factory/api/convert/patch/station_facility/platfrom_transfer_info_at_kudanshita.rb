module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::PlatformTransferInfoAtKudanshita

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::PlatformTransferInfoAtKudanshita::Info
    end
  end

end
