class TokyoMetro::Required::All::Factory::Get::Api::MetaClass < TokyoMetro::Required

  def self.other_files
    Fundamental.files + ::File.join( top_file , "find" )
  end

end
