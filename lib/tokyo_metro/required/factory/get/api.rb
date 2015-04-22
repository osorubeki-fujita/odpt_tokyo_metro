class TokyoMetro::Required::Factory::Get::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "get" , "api" )
  end

  def self.other_files
    MetaClass.files
  end

end