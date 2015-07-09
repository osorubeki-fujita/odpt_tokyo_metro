# 駅周辺の名所・施設に関する不正確な情報を修正する機能を提供するモジュール
# @note prepended to {TokyoMetro::Factory::Generate::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info} by {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::SurroundingArea.set_modules}
module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea

  private

  # Info クラスに送る変数のリスト
  # @return [::Array]
  def variables
    ary = super()
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea.updated( ary )
  end

end
