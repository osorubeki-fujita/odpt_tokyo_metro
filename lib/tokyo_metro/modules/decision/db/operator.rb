module TokyoMetro::Modules::Decision::Db::Operator

  include ::TokyoMetro::Modules::Decision::MetaClass::Operator

  def operator_of?( *args )
    super( *args , compared: operator.same_as  )
  end

end
