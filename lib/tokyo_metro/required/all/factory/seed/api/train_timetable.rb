class TokyoMetro::Required::All::Factory::Seed::Api::TrainTimetable < TokyoMetro::Required

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