module TokyoMetro::Modules::Decision::Common::Operator

  def this_operator?
    tokyo_metro?
  end

  def tokyo_metro?
    operator_info_of?( "odpt.Operator:TokyoMetro" )
  end

  def toei_subway?
    operator_info_of?( "odpt.Operator:Toei" )
  end

  def subways_in_tokyo?
    tokyo_metro? or toei_subway?
  end

  def nippori_toneri_liner?
    operator_info_of?( "odpt.Operator:ToeiNipporiToneri" )
  end

  def tokyu?
    operator_info_of?( "odpt.Operator:Tokyu" )
  end

  def yokohama_minatomirai_railway?
    operator_info_of?( "odpt.Operator:YokohamaMinatomiraiRailway" )
  end

  def toyo_rapid_railway?
    operator_info_of?( "odpt.Operator:ToyoRapidRailway" )
  end

  private

  def operator_info_of?( *args , compared: operator_info.same_as )
    compare_base( args , compared )
  end

end
