class TokyoMetro::Required::All::Factory::Decorate < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end