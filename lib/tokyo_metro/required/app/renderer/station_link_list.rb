class TokyoMetro::Required::App::Renderer::StationLinkList < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_link_list" )
  end

  def self.other_filess
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_link_list" , "meta_class" )
  end

end