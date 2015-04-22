class TokyoMetro::Required::All::Api::StationTimetable::Info::TrainTime < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_timetable" , "info" , "train_time" )
  end

  def self.other_files
    [
      ::File.join( top_file , "list" ) ,
      Info.files
    ]
  end

end