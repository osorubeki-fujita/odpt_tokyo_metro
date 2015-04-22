class TokyoMetro::Required::Modules::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "modules" , "api" )
  end

end