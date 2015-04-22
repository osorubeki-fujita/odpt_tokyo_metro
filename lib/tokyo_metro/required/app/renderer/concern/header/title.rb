class TokyoMetro::Required::App::Renderer::Concern::Header::Title < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "concern" , "header" , "title" )
  end
  
  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end