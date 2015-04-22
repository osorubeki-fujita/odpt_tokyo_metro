class TokyoMetro::Required::App::Renderer::StationFacility::Platform < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" , "platform" )
  end

  def self.other_files
    Info.files
  end

end