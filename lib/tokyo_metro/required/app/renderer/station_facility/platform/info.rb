class TokyoMetro::Required::App::Renderer::StationFacility::Platform::Info < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" , "platform" , "info" )
  end

  def self.other_files
    [
      MetaClass.files ,
      Normal.files ,
      MultipleRailwayLines.files ,
      BetweenMeguroAndShirokaneTakanawa.files ,
      BetweenWakoshiAndKotakeMukaihara.files
    ]
  end

end