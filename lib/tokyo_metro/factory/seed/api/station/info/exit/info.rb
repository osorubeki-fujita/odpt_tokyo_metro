class TokyoMetro::Factory::Seed::Api::Station::Info::Exit::Info < TokyoMetro::Factory::Seed::Api::Station::Info::Common::Info

  include ::TokyoMetro::Factory::Seed::Reference::Point

  private

  def hash_to_db
    {
      point_info_id: point_info_id( search_by: @info.point_id_urn ) ,
      station_info_id: @station_info_id
    }
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_exit
  end

end
