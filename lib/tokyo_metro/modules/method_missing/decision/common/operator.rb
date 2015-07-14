module TokyoMetro::Modules::MethodMissing::Decision::Common::Operator

  REGEXP_NOT = /\Anot_/
  REGEXP_OPERATED_BY = /\Aoperated_by_/

  private

  def method_missing( method_name , *args )
    if args.empty?
      regexp_not = ::TokyoMetro::Modules::MethodMissing::Decision::Common::Operator::REGEXP_NOT
      regexp_operated_by = ::TokyoMetro::Modules::MethodMissing::Decision::Common::Operator::REGEXP_OPERATED_BY

      method_name_to_s = method_name.to_s
      if regexp_not === method_name_to_s
        valid_method_name = method_name_to_s.gsub( regexp_not , "" )
        return send( valid_method_name )
      elsif regexp_operated_by === method_name_to_s
        valid_method_name = method_name_to_s.gsub( regexp_operated_by , "" )
        return send( valid_method_name )
      end
    end

    return super( method_name , *args )
  end

end
