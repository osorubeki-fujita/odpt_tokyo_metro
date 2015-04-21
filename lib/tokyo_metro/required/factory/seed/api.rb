class TokyoMetro::Required::Factory::Seed::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "seed" , "api" )
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