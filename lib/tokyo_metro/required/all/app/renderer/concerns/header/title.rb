class TokyoMetro::Required::All::App::Renderer::Concerns::Header::Title < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end
