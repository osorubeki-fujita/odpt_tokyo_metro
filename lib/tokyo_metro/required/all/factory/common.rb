class TokyoMetro::Required::All::Factory::Common < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "common" )
  end

end