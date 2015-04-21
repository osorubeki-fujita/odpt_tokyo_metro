class TokyoMetro::Required::Factory::Generate::Static::TrainType < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "generate" , "static" , "train_type" )
  end

  def self.other_files
    [ "color" , "custom" ].map { | filename |
      ::File.join( top_file , filename )
    } + [ "other_operator" , "default_setting" , "main" ].map { | namespace |
      files_starting_with( top_file , "custom" , namespace )
    }
  end

end