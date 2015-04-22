class TokyoMetro::Required::All::Factory::Seed::Common < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "set_optional_variables" )
  end

end