class TokyoMetro::Required::All::Modules::Dictionary::Common::RailwayLine < TokyoMetro::Required

  def self.other_files
    [ "string_info" , "string_list" , "regexp_info" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end
