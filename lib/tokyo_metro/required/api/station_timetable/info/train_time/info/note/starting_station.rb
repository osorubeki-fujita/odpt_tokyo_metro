class TokyoMetro::Required::Api::StationTimetable::Info::TrainTime::Info::Note::StartingStation < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_timetable" , "info" , "train_time" , "info" , "note" , "starting_station" )
  end

  def self.other_files
    [ "fundamental" , "ayase" , "wakoshi" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end