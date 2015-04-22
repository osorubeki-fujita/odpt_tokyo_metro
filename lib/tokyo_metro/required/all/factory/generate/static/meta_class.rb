class TokyoMetro::Required::All::Factory::Generate::Static::MetaClass < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "static" , "meta_class" )
  end

  def self.other_files
    Group.files
  end

end