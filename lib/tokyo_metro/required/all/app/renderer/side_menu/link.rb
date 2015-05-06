class TokyoMetro::Required::All::App::Renderer::SideMenu::Link < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      ToMainContent.files
    ]
  end

end