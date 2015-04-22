class TokyoMetro::Required::All::Factory::Seed < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" )
  end

  def self.other_files
    [
      Reference.files ,
      Common.files ,
      Api.files ,
      Static.files
    ]
  end

end