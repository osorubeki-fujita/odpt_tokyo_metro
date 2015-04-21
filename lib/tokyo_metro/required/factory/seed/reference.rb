class TokyoMetro::Required::Factory::Seed::Reference < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "reference" )
  end

  def self.other_files
    File.join( top_file , "station" )
  end

end