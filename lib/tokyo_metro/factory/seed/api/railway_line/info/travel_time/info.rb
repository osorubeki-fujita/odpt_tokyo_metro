class TokyoMetro::Factory::Seed::Api::RailwayLine::Info::TravelTime::Info < TokyoMetro::Factory::Seed::Api::RailwayLine::Info::MetaClass::Info

  include ::TokyoMetro::Factory::Seed::Reference::FromAndToStation

  private

  def method_name_for_db_instance_class
    :db_instance_class_of_travel_time_infos
  end

  def hash_to_db
    {
      railway_line_info_id: @railway_line_info_id ,
      from_station_info_id: from_station_info_id ,
      to_station_info_id: to_station_info_id ,
      necessary_time: @info.necessary_time
    }
  end

end
