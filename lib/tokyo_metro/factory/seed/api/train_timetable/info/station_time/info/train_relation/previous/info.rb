class TokyoMetro::Factory::Seed::Api::TrainTimetable::Info::StationTime::Info::TrainRelation::Previous::Info < TokyoMetro::Factory::Seed::Api::TrainTimetable::Info::StationTime::Info::TrainRelation::MetaClass::Info

  private

  def hash_to_db
    {
      previous_train_timetable_info_id: related_train_info_id ,
      following_train_timetable_info_id: @train_timetable_info_id
    }
  end

  def hash_for_updating_db
    { following_station_train_time_id: @station_train_time_id }
  end

end
