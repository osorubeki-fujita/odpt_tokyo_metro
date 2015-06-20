module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info
    end
  end

end
