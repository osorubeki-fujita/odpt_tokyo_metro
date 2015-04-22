class TokyoMetro::Required::All::Search < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "search" )
  end

end