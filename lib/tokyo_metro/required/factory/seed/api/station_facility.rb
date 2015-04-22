class TokyoMetro::Required::Factory::Seed::Api::StationFacility < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" )
  end

  def self.other_files
    [ List.files , Info.files ]
  end

end