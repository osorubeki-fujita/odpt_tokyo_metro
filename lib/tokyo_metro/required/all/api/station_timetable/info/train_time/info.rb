class TokyoMetro::Required::All::Api::StationTimetable::Info::TrainTime::Info < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    Note.files
  end

end