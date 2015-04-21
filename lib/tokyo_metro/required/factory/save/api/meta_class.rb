class TokyoMetro::Required::Factory::Save::Api::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "save" , "api" , "meta_class" )
  end

  def self.other_files
    [
      [ "each_file" ] ,
      [ "each_file" , "fundamental" ] ,
      [ "each_file" , "data_search" ] ,
      [ "group" ] ,
      [ "group" , "file_info" ] ,
      [ "group" , "list" ]
    ].map { | filename |
      ::File.join( top_file , *filename )
    } + files_starting_with( top_file , "group" , "file_info" )
  end

end