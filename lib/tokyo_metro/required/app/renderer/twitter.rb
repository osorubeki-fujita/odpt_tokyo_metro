class TokyoMetro::Required::App::Renderer::Twitter < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "twitter" )
  end

end