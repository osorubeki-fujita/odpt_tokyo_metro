module TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::ToiletAssistant

  private

  def method_missing( method_name , *args )
    if args.empty? and /(?:baby|babies|ostomate)/ === method_name.to_s
      valid_method_name = ::TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::ToiletAssistant::MethodName.valid_method_name_of( method_name )
      if valid_method_name.present?
        send( valid_method_name )
      end
    end

    super
  end

end
