class TokyoMetro::Required::Api::StationTimetable::Info::TrainTime::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_timetable" , "info" , "train_time" , "info" )
  end

  def self.other_files
    Note.files
  end

end