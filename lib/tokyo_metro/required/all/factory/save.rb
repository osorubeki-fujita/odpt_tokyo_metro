class TokyoMetro::Required::All::Factory::Save < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "save" )
  end

  def self.other_files
    Api.files
  end

end