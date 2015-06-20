# 駅周辺の名所・施設に関する不正確な情報を修正する機能を提供するモジュール
# @note prepended to {TokyoMetro::Factory::Generate::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info} by {TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::SurroundingArea.set_modules}
module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea

  DICTIONARY = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/additional_infos/patches/station_facility/surrounding_areas.yaml" )

  private

  # Info クラスに送る変数のリスト
  # @return [::Array]
  def variables
    ary = super()
    place_name_new = DICTIONARY[ ary.first ]
    if place_name_new.present?
      [ place_name_new ]
    else
      ary
    end
  end

end
