class TokyoMetro::Required::All::Refinement::Api < TokyoMetro::Required

  def self.other_files
    StationTimetable.files
  end

end