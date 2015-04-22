class TokyoMetro::Required::All::Refinement::Api < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "refinement" , "api" )
  end

  def self.other_files
    StationTimetable.files
  end

end