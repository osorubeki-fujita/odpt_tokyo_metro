class TokyoMetro::Required::Factory::YamlStationList < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "yaml_station_list" )
  end

end