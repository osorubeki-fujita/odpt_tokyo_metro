class TokyoMetro::Required::Factory::Seed::Static::RailwayLine < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "static" , "railway_line" )
  end

end