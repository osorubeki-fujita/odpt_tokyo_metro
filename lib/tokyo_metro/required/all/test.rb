class TokyoMetro::Required::All::Test < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "test" )
  end

end