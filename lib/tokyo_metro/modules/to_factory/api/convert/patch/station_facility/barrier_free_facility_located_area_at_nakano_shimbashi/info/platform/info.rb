# 駅施設情報内部のプラットホーム情報の不正確な情報を修正する機能を提供するモジュール
# @note {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi.set_modules} により {TokyoMetro::Api::StationFacility::Info::Platform::Info} へ include する。
# @note {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info} でも同様の名称変更を行う。
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info

  # Constructor
  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info.process( self )
  end

end
