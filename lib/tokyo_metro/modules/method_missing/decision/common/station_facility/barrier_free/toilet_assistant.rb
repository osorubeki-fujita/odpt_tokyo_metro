module TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::ToiletAssistant

  private

  def method_missing( method_name , *args )
    if args.empty? and /(?:baby|babies|ostomate)/ === method_name.to_s
      valid_method_name = method_missing__valid_method( method_name )
      if valid_method_name.present?
        send( valid_method_name )
      end
    end

    super
  end

  def method_missing__valid_method( method_name )
    case method_name.to_s
    when /\Ahas_/
      if /\Ahas_(baby_(?:chair|changing_table))(?:s)?(?:\?)?\Z/ =~ method_name.to_s
        return "has_#{$1}?"
      elsif /\Ahas_facilit(?:y|ies)_for_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/ =~ method_name.to_s
        return "has_facility_for_#{$1.singularize}?"
      end
    when /_available(?:\?)?\Z/
      if /\A(baby_(?:chair|changing_table))(?:_is|s_are)?_available(?:\?)?\Z/ =~ method_name.to_s
        return "#{$1}_available?"
      elsif /\A(?:(?:is_)(.+)|(.+)(?:_is))_available(?:\?)?\Z/ =~ method_name.to_s
        if /\Afacility_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      elsif /\A(?:(?:are_)(.+)|(.+)(?:_is))_available(?:\?)?\Z/ =~ method_name.to_s
        if /\Afacilities_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      elsif /\A(.+)_available(?:\?)?\Z/ =~ method_name.to_s
        if /\Afacilit(?:y|ies)_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      end
    when /\A(?:is_)?for_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/
      return "for_#{$1.singularize}?"
    when /\A(?:is_)?available_(?:to|for)_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/
      return "available_to_#{$1.singularize}?"
    end

    nil
  end

end
