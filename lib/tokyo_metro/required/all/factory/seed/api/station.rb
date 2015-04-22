class TokyoMetro::Required::All::Factory::Seed::Api::Station < TokyoMetro::Required

  def self.other_files
    [
      [ "common" ] ,
      [ "info" ] ,
      [ "info" , "common" ] ,
      [ "info" , "common" , "optional_variables" ]
    ].map { | dir_name |
      ::File.join( top_file , *dir_name )
    }
  end

end