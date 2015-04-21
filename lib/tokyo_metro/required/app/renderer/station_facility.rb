class TokyoMetro::Required::App::Renderer::StationFacility < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" )
  end
  
  def self.other_files
    Platform.files
  end

end