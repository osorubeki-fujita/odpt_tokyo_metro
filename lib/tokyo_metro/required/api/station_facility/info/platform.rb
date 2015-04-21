class TokyoMetro::Required::Api::StationFacility::Info::Platform < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_facility" , "info" , "platform" )
  end

  def self.other_files
    Info.files
  end

end