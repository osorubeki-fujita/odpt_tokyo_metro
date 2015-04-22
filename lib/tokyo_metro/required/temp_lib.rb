class TokyoMetro::Required::TempLib < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "temp_lib" )
  end

end