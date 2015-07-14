# @example
#   TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi.invalid_toilet_name_of_outside_toilet_in_nakano_shimbashi
#     => "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Outside.Toilet.1"
#   TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi.valid_toilet_name_of_inside_toilet_in_nakano_shimbashi
#     => "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Inside.Toilet.1"
module TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi

  include ::TokyoMetro::Modules::Fundamental::ConvertConstantToClassMethod

  # 中野新橋駅のトイレ - 不正確な名称（改札外）
  # @return [String]
  INVALID_TOILET_NAME = "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Outside.Toilet.1"

  # 中野新橋駅のトイレ - 正確な名称（改札内）
  # @return [String]
  VALID_TOILET_NAME = "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Inside.Toilet.1"

end
