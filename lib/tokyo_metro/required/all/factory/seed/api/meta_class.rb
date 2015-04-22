class TokyoMetro::Required::All::Factory::Seed::Api::MetaClass < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "meta_class" )
  end

  def self.other_files
    Timetables.files
  end

end