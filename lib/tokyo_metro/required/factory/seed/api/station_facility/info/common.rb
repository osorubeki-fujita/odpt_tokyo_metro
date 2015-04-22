class TokyoMetro::Required::Factory::Seed::Api::StationFacility::Info::Common < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "info" , "common" )
  end

  def self.other_files
    ::File.join( top_file , "set_optional_variables" )
  end

end