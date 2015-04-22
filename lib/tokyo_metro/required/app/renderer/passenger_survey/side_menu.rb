class TokyoMetro::Required::App::Renderer::PassengerSurvey::SideMenu < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "passenger_survey" , "side_menu" )
  end
  
  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end