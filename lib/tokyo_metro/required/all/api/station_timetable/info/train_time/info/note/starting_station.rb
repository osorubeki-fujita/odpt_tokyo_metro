class TokyoMetro::Required::All::Api::StationTimetable::Info::TrainTime::Info::Note::StartingStation < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [ "fundamental" , "ayase" , "wakoshi" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end