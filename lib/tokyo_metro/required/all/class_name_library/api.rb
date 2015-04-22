class TokyoMetro::Required::All::ClassNameLibrary::Api < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "class_name_library" , "api" )
  end

  def self.other_files
    StationTrainTime.files
  end

end