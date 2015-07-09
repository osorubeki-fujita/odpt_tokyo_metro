# 駅施設情報の不正確な情報を修正する機能を提供するモジュール
# @note {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi.set_modules} により {TokyoMetro::Api::StationFacility::Info::BarrierFree::Info} へ prepend される。
# @note {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info} でも同様の名称変更を行う。
module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info

  # Constructor
  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info.process( self )
  end

end
