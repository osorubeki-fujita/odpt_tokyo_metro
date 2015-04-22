class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" , "platform" , "info" , "multiple_railway_lines" )
  end

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end