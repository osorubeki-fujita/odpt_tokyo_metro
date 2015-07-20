module TokyoMetro::Initializer::ApiKey

  def self.all
    ::TokyoMetro::Initializer::ApiKey::List.new( [
      ::TokyoMetro::Initializer::ApiKey::GoogleMaps ,
      ::TokyoMetro::Initializer::ApiKey::TokyoMetroOpenData
    ] )
  end

end
