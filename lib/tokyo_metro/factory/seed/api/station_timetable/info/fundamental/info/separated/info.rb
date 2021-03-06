class TokyoMetro::Factory::Seed::Api::StationTimetable::Info::Fundamental::Info::Separated::Info < TokyoMetro::Factory::Seed::Api::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Api::StationTimetable
  include ::TokyoMetro::Factory::Seed::Api::StationTimetable::Info::Fundamental::Common

  include ::TokyoMetro::Factory::Seed::Reference::Operator
  include ::TokyoMetro::Factory::Seed::Reference::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::Station
  include ::TokyoMetro::Factory::Seed::Reference::RailwayDirection

  private

  def hash_to_db
    _railway_line_info_id = railway_line_info_id( @railway_line_infos )

    {
      info_id: @info_id ,
      operator_info_id: operator_info_id( @operator_infos ) ,
      railway_line_info_id: _railway_line_info_id ,
      station_info_id: station_info_id( @stations ) ,
      railway_direction_id: railway_direction_id( _railway_line_info_id , @railway_directions )
    }
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_fundamental_separated_info
  end

end
