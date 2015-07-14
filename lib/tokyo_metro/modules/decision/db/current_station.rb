module TokyoMetro::Modules::Decision::Db::CurrentStation

  include ::TokyoMetro::Modules::Decision::Common::CurrentStation

  def station_same_as__is_in?( *args )
    super( *args , same_as )
  end

end
