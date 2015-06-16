module TokyoMetro::Modules::Api::Convert::Patches::StationFacility::RailwayDirectionInPlatformTransferInfoAtKudanshita

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::Convert::Patches::StationFacility::RailwayDirectionInPlatformTransferInfoAtKudanshita::Info
    end
  end

end
