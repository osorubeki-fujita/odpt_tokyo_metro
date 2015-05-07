class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info < TokyoMetro::Required

  def self.other_files
    [
      MetaClass.files ,
      Normal.files ,
      MultipleRailwayLines.files ,
      #
      BetweenWakoshiAndKotakeMukaihara.files ,
      BetweenWakoshiAndHikawadai.files ,
      KotakeMukaihara.files ,
      #
      BetweenMeguroAndShirokaneTakanawa.files ,
      MeguroAndShirokanedai.files ,
      ShirokaneTakanawa.files
    ]
  end

end