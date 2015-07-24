module TokyoMetro::Modules::Decision::Db::Operator::Name

  include ::OdptCommon::Modules::Decision::Common::Operator::Name
  include ::TokyoMetro::Modules::Decision::Common::Operator::Name
  include ::OdptCommon::Modules::MethodMissing::Decision::Common::Operator

  def operator_info_of?( *args )
    super( *args , compared: operator_info.same_as  )
  end

end
