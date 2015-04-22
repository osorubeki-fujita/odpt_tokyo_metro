class TokyoMetro::Required::Refinement::Api::StationTimetable < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "refinement" , "api" , "station_timetable" )
  end

  def self.other_files
    [
      [ "info" ] ,
      [ "info" , "fundamental" ] ,
      [ "info" , "fundamental" , "info" ] ,
      [ "info" , "fundamental" , "list" ]
    ].map { | filename |
      File.join( top_file , *filename )
    }
  end

end