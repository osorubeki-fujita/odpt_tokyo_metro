class TokyoMetro::Required::All::Factory::Get::Api::MetaClass < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "get" , "api" , "meta_class" )
  end

  def self.other_files
    [ "fundamental" , "data_search" , "geo" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end