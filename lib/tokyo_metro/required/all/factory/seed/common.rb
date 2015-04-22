class TokyoMetro::Required::All::Factory::Seed::Common < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "common" )
  end

  def self.other_files
    File.join( top_file , "set_optional_variables" )
  end

end