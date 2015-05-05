class TokyoMetro::Required::All::App::Renderer::Concern::Link::ToRailwayLinePage < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      ::File.join( top_file , "from_station_facility_page" )
    ]
  end

end