class TokyoMetro::Required::App::Renderer::TravelTimeInfo::RailwayLine < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "travel_time_info" , "railway_line" )
  end
  
  def self.other_files
    YurakuchoAndFukutoshinLine.files
  end

end