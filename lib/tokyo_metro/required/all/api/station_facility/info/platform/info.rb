class TokyoMetro::Required::All::Api::StationFacility::Info::Platform::Info < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_facility" , "info" , "platform" , "info" )
  end

  def self.other_files
    Common.files
  end

end