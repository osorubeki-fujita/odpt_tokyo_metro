class TokyoMetro::Required::Factory::Seed < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" )
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