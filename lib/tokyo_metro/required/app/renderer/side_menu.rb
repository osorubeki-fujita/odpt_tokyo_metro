class TokyoMetro::Required::App::Renderer::SideMenu < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "side_menu" )
  end

  def self.other_files
    [
      Link.files ,
      NowDeveloping.files
    ]
  end

end