class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::ShirokaneTakanawa < TokyoMetro::Required

  def self.other_files
    [ "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end
