module TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::WheelChair

  def method_missing( method_name , *args )
    if args.empty? and /wheel(?:_?)chair/ === method_name.to_s
      case method_name.to_s
      when /\A(?:(?:is_)?for_)?wheel(?:_)?chair(?:s)?(?:\?)?\Z/
        return wheel_chair_accessible?
      when /\A(?:is_)?wheel(?:_)?chair(?:s)?_accessible(?:\?)?\Z/
        return wheel_chair_accessible?
      when /\A(?:is_)?available_(?:to|for)_wheel(?:_)?chair(?:s)?(?:\?)?\Z/
        return available_to_wheel_chair?
      end
    end

    super
  end

end
