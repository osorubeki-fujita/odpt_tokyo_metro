class TokyoMetro::Required::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "generate" , "api" , "station_facility" , "info" , "barrier_free" , "info" )
  end

  def self.other_files
    ServiceDetail.files
  end

end