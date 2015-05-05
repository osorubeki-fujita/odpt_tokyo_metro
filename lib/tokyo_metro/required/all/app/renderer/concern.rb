class TokyoMetro::Required::All::App::Renderer::Concern < TokyoMetro::Required

  def self.other_files
    [
      Header.files ,
      Link.files
    ]
  end

end