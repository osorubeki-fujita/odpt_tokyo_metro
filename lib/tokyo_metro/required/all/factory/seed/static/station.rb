class TokyoMetro::Required::All::Factory::Seed::Static::Station < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "static" , "station" )
  end

  def self.other_files
    ::File.join( top_file , "optional_variables" )
  end

end