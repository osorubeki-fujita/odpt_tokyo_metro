# 各駅・各路線・各方面の時刻表の情報の配列
class TokyoMetro::Api::StationTimetable::List < TokyoMetro::Api::MetaClass::NotRealTime::List

  include ::TokyoMetro::ClassNameLibrary::Api::StationTimetable
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::List

  include ::TokyoMetro::Modules::Fundamental::Api::List::Selection::RailwayLines

  def seed
    super(
      ::Operator::Info.all ,
      ::Railway::Line::Info.all ,
      ::Station::Info.all ,
      ::Railway::Direction.all ,
      display_number: true
    )
  end

  def seed_train_times( train_timetables )
    __seed__(
      train_timetables ,
      method_name: __method__ ,
      factory_name: :factory_for_seeding_train_times
    )
  end

end
