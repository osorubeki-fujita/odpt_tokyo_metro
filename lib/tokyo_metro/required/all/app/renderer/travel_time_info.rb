class TokyoMetro::Required::All::App::Renderer::TravelTimeInfo < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "travel_time_info" )
  end
  
  def self.other_files
    [ MetaClass.files , RailwayLine.files ]
  end

end