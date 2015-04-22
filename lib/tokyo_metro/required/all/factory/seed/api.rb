class TokyoMetro::Required::All::Factory::Seed::Api < TokyoMetro::Required

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