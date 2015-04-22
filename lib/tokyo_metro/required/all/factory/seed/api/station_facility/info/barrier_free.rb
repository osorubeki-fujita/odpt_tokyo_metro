class TokyoMetro::Required::All::Factory::Seed::Api::StationFacility::Info::BarrierFree < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "info" ) ,
      ServiceDetail.files ,
      ::File.join( top_file , "list" )
    ]
  end

end