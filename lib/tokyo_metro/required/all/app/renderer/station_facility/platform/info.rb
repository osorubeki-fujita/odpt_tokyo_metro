class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" , "platform" , "info" )
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