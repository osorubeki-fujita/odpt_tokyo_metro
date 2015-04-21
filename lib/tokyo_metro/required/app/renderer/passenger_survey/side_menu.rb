class TokyoMetro::Required::App::Renderer::PassengerSurvey::SideMenu < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "passenger_survey" , "side_menu" )
  end
  
  def self.other_files
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "passenger_survey" , "side_menu" , "meta_class" )
  end

end