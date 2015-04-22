class TokyoMetro::Required::All::Api::StationFacility::Info::Platform < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_facility" , "info" , "platform" )
  end

  def self.other_files
    Info.files
  end

end