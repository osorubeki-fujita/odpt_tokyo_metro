class TokyoMetro::Required::All::Api::StationFacility::Info::BarrierFree < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_facility" , "info" , "barrier_free" )
  end

  def self.other_files
    [
      ::File.join( top_file , "info" ) ,
      ::Dir.glob( "#{ top_file }/**.rb" ).sort ,
      ServiceDetail.files ,
      Facility.files
    ]
  end

end