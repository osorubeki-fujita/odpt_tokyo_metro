class TokyoMetro::Required::All::Factory::Seed::Api::TrainTimetable::Info::StationTime::Info::TrainRelation::MetaClass < TokyoMetro::Required

  def self.other_files
    [ "optional_infos" , "list" , "info" ].map {} | filename |
      ::File.join( top_file , filename )
    }
  end

end
