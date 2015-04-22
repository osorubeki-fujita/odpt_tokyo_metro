class TokyoMetro::Required::All::Api::StationTimetable::Info < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      ::File.join( top_file , "hash" ) ,
      TrainTime.files
    ]
  end

end