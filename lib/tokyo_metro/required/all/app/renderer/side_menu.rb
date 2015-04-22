class TokyoMetro::Required::All::App::Renderer::SideMenu < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "side_menu" )
  end

  def self.other_files
    [
      Link.files ,
      NowDeveloping.files
    ]
  end

end