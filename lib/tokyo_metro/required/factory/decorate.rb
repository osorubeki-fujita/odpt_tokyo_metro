class TokyoMetro::Required::Factory::Decorate < RequiredFiles::MetaClass
  
  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "decorate" )
  end

end