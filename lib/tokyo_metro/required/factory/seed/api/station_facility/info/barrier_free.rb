class TokyoMetro::Required::Factory::Seed::Api::StationFacility::Info::BarrierFree < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_facility" , "info" , "barrier_free" )
  end

  def self.other_files
    [
      ::File.join( top_file , "info" ) ,
      ServiceDetail.files ,
      ::File.join( top_file , "list" )
    ]
  end

end