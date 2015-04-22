class TokyoMetro::Required::All::Refinement::Api::StationTimetable < TokyoMetro::Required

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