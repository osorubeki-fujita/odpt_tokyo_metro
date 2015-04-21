class TokyoMetro::Required::Api::StationTimetable::Info::TrainTime::Info::Note::YurakuchoFukutoshin < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "station_timetable" , "info" , "train_time" , "info" , "note" , "yurakucho_fukutoshin" )
  end

  def self.other_files
    [
      ::Dir.glob( "#{ top_file }/**.rb" ).sort ,
      KotakeMukaihara.files ,
      TrainType.files
    ]
  end

end