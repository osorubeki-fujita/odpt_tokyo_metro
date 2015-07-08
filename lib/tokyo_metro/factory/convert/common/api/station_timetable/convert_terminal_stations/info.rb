class TokyoMetro::Factory::Convert::Common::Api::StationTimetable::ConvertTerminalStations::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object , factory_name_for_converting_train_times )
    super( object )
    @factory_name_for_converting_train_times = factory_name_for_converting_train_times
  end

  def process
    if to_process?
      @object.timetables.each do | timetable |
        timetable.each do | train_time |
          @factory_name_for_converting_train_times.process( train_time )
        end
      end
    end
  end

  private

  def to_process?
    true
  end

end
