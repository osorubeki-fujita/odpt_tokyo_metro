class TokyoMetro::Required::App::Renderer::SideMenu::Link < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "side_menu" , "link" )
  end

  def self.other_files
    MetaClass.files
  end

end