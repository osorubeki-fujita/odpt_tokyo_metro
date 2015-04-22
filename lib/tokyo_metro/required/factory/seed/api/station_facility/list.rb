class TokyoMetro::Required::Factory::Seed::Api::StationFacility::List < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "list" )
  end

  def self.other_files
    ::File.join( top_file , "common" )
  end

end