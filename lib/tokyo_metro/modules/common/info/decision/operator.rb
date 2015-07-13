module TokyoMetro::Modules::Common::Info::Decision::Operator

  def tokyo_metro?
    operator_of?( "odpt.Operator:TokyoMetro" )
  end

  def operated_by_tokyo_metro?
    tokyo_metro?
  end

  [ :tokyo_metro? , :operated_by_tokyo_metro? ].each do | method_base_name |
    eval <<-DEF
      def not_#{ method_base_name }
        !( #{ method_base_name } )
      end
    DEF
  end

  def toei_subway?
    operator_of?( "odpt.Operator:Toei" )
  end

  def subways_in_tokyo?
    tokyo_metro? or toei_subway?
  end

  def nippori_toneri_liner?
    operator_of?( "odpt.Operator:ToeiNipporiToneri" )
  end

  def tokyu?
    operator_of?( "odpt.Operator:Tokyu" )
  end

  def yokohama_minatomirai_railway?
    operator_of?( "odpt.Operator:YokohamaMinatomiraiRailway" )
  end

  def toyo_rapid_railway?
    operator_of?( "odpt.Operator:ToyoRapidRailway" )
  end

  private

  def operator_of?( *args , compared: operator.same_as )
    compare_base( args , compared )
  end

  def method_missing( method_name , *args )
    if args.empty? and /\Aoperated_by_/ === method_name.to_s
      valid_method_name = method_name.to_s.gsub( /\Aoperated_by/ , "" )
      send( valid_method_name )
    else
      super( method_name , *args )
    end
  end

end
