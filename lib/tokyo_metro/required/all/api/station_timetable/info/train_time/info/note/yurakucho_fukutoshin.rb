class TokyoMetro::Required::All::Api::StationTimetable::Info::TrainTime::Info::Note::YurakuchoFukutoshin < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      all_files_in_the_same_directory ,
      KotakeMukaihara.files ,
      TrainType.files
    ]
  end

end
