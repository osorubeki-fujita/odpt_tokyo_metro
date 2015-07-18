class TokyoMetro::Factory::Seed::Api::Station::Info::ConnectingRailwayLine::Info < TokyoMetro::Factory::Seed::Api::Station::Info::Common::Info

  include ::TokyoMetro::Factory::Seed::Reference::RailwayLine

  private

  # @todo prepend される {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine::Factory::Seed::Info::ConnectingRailwayLine::Info} で、 railway_line_info_id の列を廃止する（railway_line_info_id は station_info_id からアクセスできるようにする）。
  def hash_to_db
    {
      station_info_id: @station_info_id ,
      railway_line_info_id: railway_line_info_id
    }
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_connecting_railway_line_info
  end

end
