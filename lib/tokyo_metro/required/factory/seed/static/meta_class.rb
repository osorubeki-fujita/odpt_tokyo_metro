class TokyoMetro::Required::Factory::Seed::Static::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "static" , "meta_class" )
  end

end