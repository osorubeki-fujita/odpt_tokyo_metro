class TokyoMetro::Required::All::App::Renderer::Concern::Header < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "concern" , "header" )
  end
  
  def self.other_files
    [
      ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "concern" , "header" , "meta_class" ) ,
      Title.files ,
      ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "concern" , "header" , "content" )
    ]
  end

end