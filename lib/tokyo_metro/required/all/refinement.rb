class TokyoMetro::Required::All::Refinement < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "refinement" )
  end

  def self.other_files
    Api.files
  end

end