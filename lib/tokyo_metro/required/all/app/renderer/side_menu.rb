class TokyoMetro::Required::All::App::Renderer::SideMenu < TokyoMetro::Required

  def self.other_files
    [
      Link.files ,
      NowDeveloping.files
    ]
  end

end