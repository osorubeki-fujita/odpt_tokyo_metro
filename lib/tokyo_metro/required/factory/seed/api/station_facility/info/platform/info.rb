class TokyoMetro::Required::Factory::Seed::Api::StationFacility::Info::Platform::Info < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "info" , "platform" , "info" )
  end

  def self.other_files
    Common.files
  end

end