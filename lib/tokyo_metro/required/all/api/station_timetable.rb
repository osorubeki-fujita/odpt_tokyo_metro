class TokyoMetro::Required::All::Api::StationTimetable < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_timetable" )
  end

  def self.other_files
    Info.files
  end

end