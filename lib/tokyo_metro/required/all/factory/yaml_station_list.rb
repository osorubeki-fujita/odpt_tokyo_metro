class TokyoMetro::Required::All::Factory::YamlStationList < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "yaml_station_list" )
  end

end