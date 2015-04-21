class TokyoMetro::Required::App::Renderer::PassengerSurvey < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "passenger_survey" )
  end
  
  def self.other_files
    SideMenu.files
  end

end