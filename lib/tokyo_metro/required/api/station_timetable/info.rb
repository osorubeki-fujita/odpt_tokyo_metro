class TokyoMetro::Required::Api::StationTimetable::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_timetable" , "info" )
  end

  def self.other_files
    [
      ::File.join( top_file , "hash" ) ,
      TrainTime.files
    ]
  end

end