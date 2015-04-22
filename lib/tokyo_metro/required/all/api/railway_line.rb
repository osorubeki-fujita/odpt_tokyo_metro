class TokyoMetro::Required::All::Api::RailwayLine < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "railway_line" )
  end

end