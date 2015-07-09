class TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ConvertStationName::Info::StationTime::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    convert_station_names
  end

  private

  def convert_station_names
    set_new_station_name( :@arrival_station )
    set_new_station_name( :@departure_station )
  end

  #--------

  def set_new_station_name( instance_variable_name )
    @object.instance_variable_set( instance_variable_name , station_name_new( instance_variable_name ) )
  end

  def station_name_new( instance_variable_name )
    station_name = @object.instance_variable_get( instance_variable_name )
    if station_name.present?
      station_name.gsub( /(?<=\Aodpt\.Station\:TokyoMetro\.)Yurakucho/ , "Fukutoshin" )
    else
      nil
    end
  end

end
