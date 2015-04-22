class TokyoMetro::Required::All::App::Renderer < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" )
  end

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      Concern.files ,
      Document.files ,
      PassengerSurvey.files ,
      SideMenu.files ,
      StationFacility.files ,
      StationLinkList.files ,
      Twitter.files ,
      TravelTimeInfo.files
    ]
  end

end