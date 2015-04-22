class TokyoMetro::Required::All::Api::StationFacility::Info::BarrierFree::Facility < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_facility" , "info" , "barrier_free" , "facility" )
  end

  def self.other_files
    MetaClass.files
  end

end