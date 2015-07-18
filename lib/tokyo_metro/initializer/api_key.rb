module TokyoMetro::Initializer::ApiKey

  def self.all
    ::TokyoMetro::Initializer::ApiKey.new( [
      ::TokyoMetro::Initializer::ApiKey::GoogleMaps ,
      ::TokyoMetro::Initializer::ApiKey::TokyoMetroOpenData
    ] )
  end

end
