class TokyoMetro::Required::Factory::Seed::Api::Station < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station" )
  end

  def self.other_files
    [
      [ "common" ] ,
      [ "info" ] ,
      [ "info" , "common" ] ,
      [ "info" , "common" , "optional_variables" ]
    ].map { | dir_name |
      ::File.join( top_file , *dir_name )
    }
  end

end