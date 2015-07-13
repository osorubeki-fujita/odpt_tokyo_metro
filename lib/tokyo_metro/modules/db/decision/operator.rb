module TokyoMetro::Modules::Db::Decision::Operator

  include ::TokyoMetro::Modules::Common::Info::Decision::Operator

  def operator_of?( *args )
    super( *args , compared: operator.same_as  )
  end

end
