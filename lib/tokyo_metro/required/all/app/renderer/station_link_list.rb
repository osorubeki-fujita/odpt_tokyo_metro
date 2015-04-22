class TokyoMetro::Required::All::App::Renderer::StationLinkList < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_link_list" )
  end

  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end