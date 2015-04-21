class TokyoMetro::Required::Api::StationFacility::Info::BarrierFree::Facility::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_facility" , "info" , "barrier_free" , "facility" , "meta_class" )
  end

  def self.other_files
    LinkForMobilityScootersAndStairLift.files
  end

end