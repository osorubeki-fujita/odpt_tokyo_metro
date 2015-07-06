class TokyoMetro::Factory::Convert::Common::Api::Station::StationCode < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object , station_same_as , station_code_new )
    super( object )
    @station_same_as = station_same_as
    @station_code_new = station_code_new
  end

  def process
    if object.same_as == @station_same_as
      object.instance_variable_set( :@station_code , "m06" )
    end
  end

end
