class TokyoMetro::Required::All::App::Renderer::Concern::Header < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      Title.files ,
      ::File.join( top_file , "content" )
    ]
  end

end