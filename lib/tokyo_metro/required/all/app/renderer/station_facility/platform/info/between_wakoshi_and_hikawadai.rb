class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndHikawadai < TokyoMetro::Required

  def self.other_files
    [ "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end