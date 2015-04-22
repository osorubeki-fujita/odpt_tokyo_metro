class TokyoMetro::Required::Factory::Seed::Api::StationTimetable < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" , "station_timetable" )
  end

  def self.other_files
    [
      [ "common" ] ,
      [ "info" ] ,
      [ "info" , "fundamental" ] ,
      [ "info" , "fundamental" , "common" ] ,
      [ "info" , "fundamental" , "list" ]
    ].map { | dirname |
      File.join( top_file , *dirname )
    }
  end

end