class TokyoMetro::Required::Api::StationFacility < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_facility" )
  end

  def self.other_files
    Info.files
  end

end