class TokyoMetro::Required::App::Renderer::TravelTimeInfo::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "travel_time_info" , "meta_class" )
  end
  
  def self.other_files
    [ "columns" , "common" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end