# バリアフリー施設情報に関する不正確な情報を修正する機能を提供するモジュールを格納する名前空間
# @note prepend {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info} in {TokyoMetro::Api::StationFacility::Info::BarrierFree::Info}
# @note prepend {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info} in {TokyoMetro::Api::StationFacility::Info::Platform::Info}
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info::BarrierFree::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info
    end

    ::TokyoMetro::Api::StationFacility::Info::Platform::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info
    end
  end

end
