class TokyoMetro::Factory::Convert::Common::Api::Station::StationCode < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( obj , station_same_as , station_code_new )
    super( obj )
    @station_same_as = station_same_as
    @station_code_new = station_code_new
  end

  def process
    if obj.same_as == @station_same_as
      obj.instance_variable_set( :@station_code , "m06" )
    end
  end

end
