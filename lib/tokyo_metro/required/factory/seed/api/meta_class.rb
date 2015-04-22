class TokyoMetro::Required::Factory::Seed::Api::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "meta_class" )
  end

  def self.other_files
    Timetables.files
  end

end