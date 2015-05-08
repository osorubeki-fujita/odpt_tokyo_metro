class TokyoMetro::Required::All::Api::Point < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      ::File.join( top_file , "info" , "title" ) ,
      ::File.join( top_file , "info" , "title" , "code" )
    ]
  end

end