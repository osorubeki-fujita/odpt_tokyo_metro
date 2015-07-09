class TokyoMetro::Required::All::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Refinement::Info::StationTime < TokyoMetro::Required

  def self.other_files
    [ "info" , "list" ].map { | filename | ::File.join( top_file , filename ) }
  end

end
