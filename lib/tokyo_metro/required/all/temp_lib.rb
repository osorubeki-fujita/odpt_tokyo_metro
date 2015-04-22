class TokyoMetro::Required::All::TempLib < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "temp_lib" )
  end

end