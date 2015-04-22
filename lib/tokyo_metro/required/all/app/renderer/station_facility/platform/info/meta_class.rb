class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::MetaClass < TokyoMetro::Required

  def self.other_files
    [ "common" , "whole" , "each_direction" ].map { | filename |
      ::File.join( top_file , filename )
    } + TableRow.files
  end

end