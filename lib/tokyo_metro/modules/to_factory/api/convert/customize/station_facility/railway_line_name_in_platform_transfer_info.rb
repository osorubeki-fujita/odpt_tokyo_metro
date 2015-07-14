module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfos

  # モジュールをクラスに追加するためのメソッド
  # @note
  #   {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfos::Info} is prepended
  #     to {TokyoMetro::Api::StationFacility::Info} by this method.
  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfos::Info
    end
  end

end
