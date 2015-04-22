class TokyoMetro::Required::All::Factory::Generate::Static::MetaClass::Group < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "static" , "meta_class" , "group" )
  end

  def self.other_files
    [ "fundamental" , "multiple_yamls" , "hash_in_hash" ].map { | filename |
      files_starting_with( top_file , filename )
    }
  end

end