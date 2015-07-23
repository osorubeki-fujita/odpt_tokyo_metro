class TokyoMetro::Required::All::Factory::Decorate < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      ::File.join( top_file , "settings" ) ,
      Api.files
    ]
  end

end
