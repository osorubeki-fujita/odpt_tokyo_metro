class TokyoMetro::Required::All::Factory::Generate::Static::MetaClass::Group < TokyoMetro::Required

  def self.other_files
    [ "fundamental" , "multiple_yamls" , "hash_in_hash" ].map { | filename |
      files_starting_with( top_file , filename )
    }
  end

end