class TokyoMetro::Required::All::App::Renderer::Concerns::Link::ToRailwayLinePage::ConnectingRailwayLine < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      ::File.join( top_file , "from_railway_line_page" )
    ]
  end

end
