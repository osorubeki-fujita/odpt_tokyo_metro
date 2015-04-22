class TokyoMetro::Required::Factory::Generate::Api::StationFacility::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "api" , "station_facility" , "info" )
  end

  def self.other_files
    [ BarrierFree.files , Platform.files ]
  end

end