class TokyoMetro::Required::All::App::Renderer::StationFacility < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" )
  end

  def self.other_files
    Platform.files
  end

end