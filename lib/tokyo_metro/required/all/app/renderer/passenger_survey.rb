class TokyoMetro::Required::All::App::Renderer::PassengerSurvey < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "passenger_survey" )
  end
  
  def self.other_files
    SideMenu.files
  end

end