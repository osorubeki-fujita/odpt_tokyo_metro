class TokyoMetro::Required::App::Renderer::PassengerSurvey::Table < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "passenger_survey" , "table" )
  end
  
  def self.other_files
    MetaClass.files
  end

end