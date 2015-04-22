class TokyoMetro::Required::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" , "platform" , "info" , "between_wakoshi_and_kotake_mukaihara" )
  end

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end