class TokyoMetro::Required::Factory::Seed::Static::Station < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "static" , "station" )
  end

  def self.other_files
    ::File.join( top_file , "optional_variables" )
  end

end