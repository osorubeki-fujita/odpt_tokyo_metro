class TokyoMetro::Required::All::Factory::Seed::Static < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "static" )
  end

  def self.other_files
    [
      MetaClass.files ,
      Operator.files ,
      RailwayLine.files ,
      Station.files
    ]
  end

end