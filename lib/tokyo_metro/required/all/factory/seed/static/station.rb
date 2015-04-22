class TokyoMetro::Required::All::Factory::Seed::Static::Station < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "optional_variables" )
  end

end