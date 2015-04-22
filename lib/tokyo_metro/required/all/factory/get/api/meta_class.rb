class TokyoMetro::Required::All::Factory::Get::Api::MetaClass < TokyoMetro::Required

  def self.other_files
    [ "fundamental" , "data_search" , "geo" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end