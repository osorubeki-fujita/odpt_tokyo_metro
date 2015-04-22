class TokyoMetro::Required::App::Renderer::StationFacility::Platform::Info::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "app" , "renderer" , "station_facility" , "platform" , "info" , "meta_class" )
  end

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    } + TableRow.files
  end

end