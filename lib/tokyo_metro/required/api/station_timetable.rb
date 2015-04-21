class TokyoMetro::Required::Api::StationTimetable < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_timetable" )
  end

  def self.other_files
    Info.files
  end

end