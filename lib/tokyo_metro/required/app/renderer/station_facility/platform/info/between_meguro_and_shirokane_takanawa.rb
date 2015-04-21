class TokyoMetro::Required::App::Renderer::StationFacility::Platform::Info::BetweenMeguroAndShirokaneTakanawa < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" , "platform" , "info" , "between_meguro_and_shirokane_takanawa" )
  end

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "app" , "renderer" , "station_facility" , "platform" , "info" , "between_meguro_and_shirokane_takanawa" , filename )
    }
  end

end