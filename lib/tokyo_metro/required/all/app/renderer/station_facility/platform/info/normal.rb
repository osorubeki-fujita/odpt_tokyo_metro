class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::Normal < TokyoMetro::Required

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end