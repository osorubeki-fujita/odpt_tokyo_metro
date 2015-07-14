# @note {TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::WheelChair::Accessibility::AliasTowardsAvailability}
module TokyoMetro::Modules::Decision::Api::StationFacility::BarrierFree::WheelChair::Accessibility::All

  # @!group 車いすの利用に関するメソッド

  # 一般的な車いすが利用可能か否かを判定するメソッド
  # @return [Boolean]
  # @note すべて true（ハンドル型電動車いすが利用可能であれば一般的な車いすも利用可能であろう、という推論ベース）
  def wheel_chair_accessible
    true
  end

  # @!endgroup

end
