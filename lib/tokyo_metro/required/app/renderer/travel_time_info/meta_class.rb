class TokyoMetro::Required::App::Renderer::TravelTimeInfo::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "travel_time_info" , "meta_class" )
  end
  
  def self.other_files
    [ "columns" , "common" ].map { | filename |
      ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "travel_time_info" , "meta_class" , filename )
    }
  end

end