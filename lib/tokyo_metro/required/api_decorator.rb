class TokyoMetro::Required::ApiDecorator < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api_decorator" )
  end

end