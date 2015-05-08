module TokyoMetro::Dictionary

  ENGLISH = ::YAML.load_file( "#{ DICTIONARY_DIR }/english.yaml" )
  
  def self.english
    ENGLISH
  end

end