class TokyoMetro::Required::All::App::Renderer::Concern::Link < TokyoMetro::Required

  def self.other_files
    [
      Normal.files ,
      ToRailwayLinePage.files
    ]
  end

end