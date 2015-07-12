class TokyoMetro::Required::All::Factory::Seed::Api::TrainTimetable < TokyoMetro::Required

  def self.other_files
    [ ::File.join( top_file , "common" ) , Info.files ]
  end

end
