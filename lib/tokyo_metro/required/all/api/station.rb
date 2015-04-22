class TokyoMetro::Required::All::Api::Station < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station" )
  end

end