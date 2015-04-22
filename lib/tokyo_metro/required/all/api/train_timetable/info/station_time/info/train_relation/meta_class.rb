class TokyoMetro::Required::All::Api::TrainTimetable::Info::StationTime::Info::TrainRelation::MetaClass < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "train_timetable" , "info" , "station_time" , "info" , "train_relation" , "meta_class" )
  end

  def self.other_files
    [ "list" , "info" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end