class TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object , method_name_send_to_train_time )
    super( object )
    @method_name_send_to_train_time = method_name_send_to_train_time
  end

  def process
    @object.timetables.each do | timetable |
      timetable.each do | train_time |
        train_time.send( @method_name_send_to_train_time )
      end
    end
  end

end
