class TokyoMetro::Required::All::Factory::Seed::Api::StationFacility::Info < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "info" )
  end

  def self.other_files
    [ Common.files , BarrierFree.files , Platform.files ]
  end

end