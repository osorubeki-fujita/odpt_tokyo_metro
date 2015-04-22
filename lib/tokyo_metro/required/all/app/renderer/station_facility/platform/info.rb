class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info < TokyoMetro::Required

  def self.other_files
    [
      MetaClass.files ,
      Normal.files ,
      MultipleRailwayLines.files ,
      BetweenMeguroAndShirokaneTakanawa.files ,
      BetweenWakoshiAndKotakeMukaihara.files
    ]
  end

end