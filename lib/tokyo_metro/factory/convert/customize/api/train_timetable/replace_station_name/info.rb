class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info

  def initialize( object , regexp_for_replaced_station , replacing_string )
    @object = object
    @regexp_for_replaced_station = regexp_for_replaced_station
    @replacing_string = replacing_string
  end

  attr_reader :object

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

  def self.process( object , regexp_for_replaced_station , replacing_string )
    self.new( object , regexp_for_replaced_station , replacing_string ).process
  end

end
