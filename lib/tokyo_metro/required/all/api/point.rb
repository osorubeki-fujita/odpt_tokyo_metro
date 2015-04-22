class TokyoMetro::Required::All::Api::Point < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "point" )
  end

  def self.other_files
    ::File.join( top_file , "info" , "title" )
  end

end