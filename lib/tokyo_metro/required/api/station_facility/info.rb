class TokyoMetro::Required::Api::StationFacility::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_facility" , "info" )
  end

  def self.other_files
    [
      ::Dir.glob( "#{ top_file }/**.rb" ) ,
      BarrierFree.files ,
      Platform.files
    ]
  end

end