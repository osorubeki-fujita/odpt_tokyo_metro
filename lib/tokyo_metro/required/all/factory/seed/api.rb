class TokyoMetro::Required::All::Factory::Seed::Api < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "seed" , "api" )
  end

  def self.other_files
    [
      MetaClass.files ,
      Station.files ,
      StationFacility.files ,
      StationTimetable.files ,
      TrainTimetable.files
    ]
  end

end