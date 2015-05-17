class TokyoMetro::Required::All::App::Renderer::TravelTimeInfo::MetaClass < TokyoMetro::Required

  def self.other_files
    [ "columns" , "common" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end