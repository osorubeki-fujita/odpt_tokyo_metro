module TokyoMetro::Modules::Decision::Db::Operator

  include ::TokyoMetro::Modules::Decision::Common::Operator
  include ::OdptCommon::Modules::MethodMissing::Decision::Common::Operator

  def operator_info_of?( *args )
    super( *args , compared: operator_info.same_as  )
  end

end
