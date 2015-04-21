class TokyoMetro::Required::Api::StationFacility::Info::Platform::Info < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_facility" , "info" , "platform" , "info" )
  end

  def self.other_files
    Common.files
  end

end