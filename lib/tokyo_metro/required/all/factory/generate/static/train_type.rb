class TokyoMetro::Required::All::Factory::Generate::Static::TrainType < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "static" , "train_type" )
  end

  def self.other_files
    [ "color" , "custom" ].map { | filename |
      ::File.join( top_file , filename )
    } + [ "other_operator" , "default_setting" , "main" ].map { | namespace |
      files_starting_with( top_file , "custom" , namespace )
    }
  end

end