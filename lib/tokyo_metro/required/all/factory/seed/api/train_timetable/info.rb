class TokyoMetro::Required::All::Factory::Seed::Api::TrainTimetable::Info < TokyoMetro::Required

  def self.other_files
    StationTime.files
  end

end
