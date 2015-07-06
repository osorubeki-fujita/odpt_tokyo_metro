class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object , regexp_for_replaced_station , replacing_string )
    super( object )
    @regexp_for_replaced_station = regexp_for_replaced_station
    @replacing_string = replacing_string
  end

  def process
    object.valid_timetables.each do | timetable |
      timetable.each do | station_time |

        [ :arrival_station , :departure_station ].each do | method |
          station_name = station_time.send( method )
          if station_name.present? and @regexp_for_replaced_station === station_name
            station_name_new = station_name.gsub( @regexp_for_replaced_station , @replacing_string )
            station_time.instance_variable_set( ":@#{ method }" , station_name_new )
          end
        end

      end
    end
  end

end
