class TokyoMetro::Required::Factory::Seed::Common < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "common" )
  end

  def self.other_files
    File.join( top_file , "set_optional_variables" )
  end

end