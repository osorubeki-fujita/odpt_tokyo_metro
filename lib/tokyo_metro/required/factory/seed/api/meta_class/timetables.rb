class TokyoMetro::Required::Factory::Seed::Api::MetaClass::Timetables < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "api" , "meta_class" , "timetables" )
  end

  def self.other_files
    [
      files_starting_with( top_file , "train_type_modules" ) ,
      files_starting_with( top_file , "train_type" ) ,
    ]
  end

end