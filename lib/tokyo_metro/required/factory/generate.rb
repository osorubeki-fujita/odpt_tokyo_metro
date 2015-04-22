class TokyoMetro::Required::Factory::Generate < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" )
  end

  def self.other_files
    [ Api.files , Static.files ]
  end

end