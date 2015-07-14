module TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::MobilityScooter

  def method_missing( method_name , *args )
    if args.empty? and /mobility_scooter/ === method_name.to_s
      case method_name.to_s
      when /\A(?:(?:is_)?for_)?mobility_scooter(?:s)?(?:\?)?\Z/
        return mobility_scooter_accessible?
      when /\A(?:is_)?mobility_scooter(?:s)?_accessible(?:\?)?\Z/
        return mobility_scooter_accessible?
      when /\A(?:is_)?available_(?:to|for)_mobility_scooter(?:s)?(?:\?)?\Z/
        return available_to_mobility_scooter?
      end
    end

    super
  end

end
