# 車いす対応エスカレーターの利用に関するメソッドを提供するモジュール
module TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::WheelChair::Availability::Escalator

  def is_escalator_available_to_wheel_chair
    escalator? and is_available_to_wheel_chair
  end

  alias :escalator_available_to_wheel_chair? :is_escalator_available_to_wheel_chair
  alias :wheel_chair_accessible_escalator :is_escalator_available_to_wheel_chair
  alias :wheel_chair_accessible_escalator? :wheel_chair_accessible_escalator

end
