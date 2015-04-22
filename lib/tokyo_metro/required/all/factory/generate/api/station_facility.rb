class TokyoMetro::Required::All::Factory::Generate::Api::StationFacility < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "api" , "station_facility" )
  end

  def self.other_files
    [ Info.files , List.files ]
  end

end