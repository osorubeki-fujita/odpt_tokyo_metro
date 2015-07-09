class TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Generate::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  using TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Refinement::Info

  def initialize( object )
    super( object )
    @proc_for_invalid_trains = ::Proc.new { | item | item.invalid_fukutoshin_line_trains_on_yurakucho_line? }
  end

  def process
    move_station_time_infos_from_invalid_fukutoshin_line_trains_in_yurakucho_line
    delete_invalid_fukutoshin_line_trains_in_yurakucho_line
    return nil
  end

  private

  # 不正な値が含まれている列車時刻表を返すメソッド
  # @return [Array]
  def invalid_trains
    @object.select( &( @proc_for_invalid_trains ) )
  end

  def move_station_time_infos_from_invalid_fukutoshin_line_trains_in_yurakucho_line
    train_timetables = @object

    invalid_trains.each do | invalid_train |
      ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Info.process( invalid_train , train_timetables )
    end
    return nil
  end

  # 不正な値が含まれている列車時刻表を削除するメソッド
  # @return [nil]
  def delete_invalid_fukutoshin_line_trains_in_yurakucho_line
    @object.reject!( &( @proc_for_invalid_trains ) )
    return nil
  end

end
