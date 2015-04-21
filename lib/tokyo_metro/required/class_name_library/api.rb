class TokyoMetro::Required::ClassNameLibrary::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "class_name_library" , "api" )
  end

  def self.other_files
    StationTrainTime.files
  end

end