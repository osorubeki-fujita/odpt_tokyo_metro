class TokyoMetro::Required::Api::TrainTimetable::Info < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "train_timetable" , "info" )
  end

  def self.other_files
    StationTime.files
  end

end