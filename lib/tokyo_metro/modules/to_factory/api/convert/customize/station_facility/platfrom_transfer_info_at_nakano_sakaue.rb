module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info
    end
  end

end
