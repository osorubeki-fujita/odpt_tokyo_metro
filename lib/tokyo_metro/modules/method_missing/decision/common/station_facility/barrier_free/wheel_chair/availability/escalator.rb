# 車いす対応エスカレーターの利用に関するメソッドを提供するモジュール
module TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::WheelChair::Availability::Escalator

  private

  def method_missing( method_name , *args )
    if args.empty? and /wheel(?:_?)chair/ === method_name.to_s
      case method_name.to_s
      when /\A(?:is_)?escalator_for_wheel(?:_)?chair(?:s)?(?:\?)?\Z/
        return wheel_chair_accessible_escalator?
      when /\A(?:is_)?wheel(?:_)?chair(?:s)?_accessible_escalator(?:\?)?\Z/
        return wheel_chair_accessible_escalator?
      when /\A(?:is_)?escalator_available_(?:to|for)_wheel(?:_)?chair(?:s)?(?:\?)?\Z/
        return escalator_available_to_wheel_chair?
      end
    end

    super
  end

end
