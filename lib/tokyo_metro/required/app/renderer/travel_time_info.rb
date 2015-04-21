class TokyoMetro::Required::App::Renderer::TravelTimeInfo < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "travel_time_info" )
  end
  
  def self.other_files
    [ MetaClass.files , RailwayLine.files ]
  end

end