class TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::ToiletAssistant::MethodName

  def self.valid_method_name_of( method_name )
    self.new( method_name ).get_name
  end

  def initialize( method_name )
    @method_name = method_name.to_s
  end

  def get_name
    case @method_name
    when /\Ahas_/
      if /\Ahas_(baby_(?:chair|changing_table))(?:s)?(?:\?)?\Z/ =~ @method_name
        return "has_#{$1}?"
      elsif /\Ahas_facilit(?:y|ies)_for_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/ =~ @method_name
        return "has_facility_for_#{$1.singularize}?"
      end
    when /_available(?:\?)?\Z/
      if /\A(baby_(?:chair|changing_table))(?:_is|s_are)?_available(?:\?)?\Z/ =~ @method_name
        return "#{$1}_available?"
      elsif /\A(?:(?:is_)(.+)|(.+)(?:_is))_available(?:\?)?\Z/ =~ @method_name
        if /\Afacility_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      elsif /\A(?:(?:are_)(.+)|(.+)(?:_is))_available(?:\?)?\Z/ =~ @method_name
        if /\Afacilities_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      elsif /\A(.+)_available(?:\?)?\Z/ =~ @method_name
        if /\Afacilit(?:y|ies)_for_(ostomate(?:s)?|bab(?:y|ies))/ =~ $1
          return "facility_for_#{$1.singularize}_available?"
        end
      end
    when /\A(?:is_)?for_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/
      return "for_#{$1.singularize}?"
    when /\A(?:is_)?available_(?:to|for)_(ostomate(?:s)?|bab(?:y|ies))(?:\?)?\Z/
      return "available_to_#{$1.singularize}?"
    end

    return nil
  end

end
