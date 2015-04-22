class TokyoMetro::Required::All::App::Renderer::Concern < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "concern" )
  end

  def self.other_files
    Header.files
  end

end