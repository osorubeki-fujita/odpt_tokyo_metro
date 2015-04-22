class TokyoMetro::Required::All::Factory::Seed::Reference < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "station" )
  end

end