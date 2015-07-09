class TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  using TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Refinement::Info

  def initialize( object , train_timetables )
    super( object )
    @train_timetables = train_timetables
    set_valid_train
  end

  def process
    @valid_train.instance_variable_set( :@weekdays , valid_station_times_on_weekdays )
  end

  private

  # 有楽町線
  def invalid_train
    @object
  end

  # @note 副都心線
  def set_valid_train
    @valid_train = invalid_train.valid_fukutoshin_line_train( @train_timetables )
  end

  def valid_station_times_on_weekdays
    ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ValidStationTimesOnWeekdays::Info.get_by( invalid_train , @valid_train )
  end

end
