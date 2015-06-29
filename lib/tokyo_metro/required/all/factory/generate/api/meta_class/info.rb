class TokyoMetro::Required::All::Factory::Generate::Api::MetaClass::Info < TokyoMetro::Required

  def self.other_files
    [
      Fundamental.files ,
      ::File.join( top_file , "not_on_the_top_layer" )
    ]
  end

end
