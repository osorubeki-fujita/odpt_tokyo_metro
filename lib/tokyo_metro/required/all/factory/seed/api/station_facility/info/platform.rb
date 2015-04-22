class TokyoMetro::Required::All::Factory::Seed::Api::StationFacility::Info::Platform < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "info" , "platform" )
  end

  def self.other_files
    Info.files
  end

end