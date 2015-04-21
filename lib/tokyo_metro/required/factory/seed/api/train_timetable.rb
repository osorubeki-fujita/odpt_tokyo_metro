class TokyoMetro::Required::Factory::Seed::Api::TrainTimetable < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "api" , "train_timetable" )
  end

  def self.other_files
    [
      [ "common" ] ,
      [ "info" ] ,
      [ "info" , "station_time" ] ,
      [ "info" , "station_time" , "info" ] ,
      [ "info" , "station_time" , "info" , "train_relation" ] ,
      [ "info" , "station_time" , "info" , "train_relation" , "meta_class" ] ,
      [ "info" , "station_time" , "info" , "train_relation" , "meta_class" , "optional_infos" ] ,
      [ "info" , "station_time" , "info" , "train_relation" , "meta_class" , "list" ] ,
      [ "info" , "station_time" , "info" , "train_relation" , "meta_class" , "info" ]
    ].map { | dirname |
      ::File.join( top_file , *dirname )
    }
  end

end