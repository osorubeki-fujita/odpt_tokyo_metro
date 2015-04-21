class TokyoMetro::Required::Factory::Generate::Api::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "generate" , "api" , "meta_class" )
  end

  def self.other_files
    [
      [ "info" ] ,
      [ "info" , "fundamental" ] ,
      [ "info" , "not_on_the_top_layer" ] ,
      [ "list" ] ,
      [ "list" , "normal" ] ,
      [ "list" , "date" ]
    ].map { | file_basename |
      ::File.join( top_file , *file_basename )
    }
  end

end