class TokyoMetro::Required::All::App::Renderer::SideMenu::Link < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "side_menu" , "link" )
  end

  def self.other_files
    MetaClass.files
  end

end