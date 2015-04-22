class TokyoMetro::Required::Refinement::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "refinement" , "api" )
  end

  def self.other_files
    StationTimetable.files
  end

end