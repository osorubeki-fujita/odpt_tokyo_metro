module TokyoMetro::Modules::Decision::Db::Station::Current

  include ::TokyoMetro::Modules::Decision::Common::Station::Current

  def station_same_as__is_in?( *args )
    super( *args , same_as )
  end

end
