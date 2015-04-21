class TokyoMetro::Required::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" , "platform" , "info" , "multiple_railway_lines" )
  end

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" , "platform" , "info" , "multiple_railway_lines" , filename )
    }
  end

end