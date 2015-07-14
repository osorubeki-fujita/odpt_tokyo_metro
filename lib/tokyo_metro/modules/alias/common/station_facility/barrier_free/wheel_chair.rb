# @note wheel_chair_accessible の別名として、wheel_chair_accessible? を定義
# @note is_available_to_wheel_chair の別名として、available_to_wheel_chair? を定義
module TokyoMetro::Modules::Alias::Common::StationFacility::BarrierFree::WheelChair

  # @note
  def wheel_chair_accessible?
    wheel_chair_accessible
  end

  # @note
  def available_to_wheel_chair?
    is_available_to_wheel_chair
  end

end
