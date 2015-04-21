class TokyoMetro::Required::Api::RailwayLine < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "railway_line" )
  end

end