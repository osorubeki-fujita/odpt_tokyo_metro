class TokyoMetro::Required::All::Factory::Decorate < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "current_path" ) ,
      Api.files
    ]
  end

end
