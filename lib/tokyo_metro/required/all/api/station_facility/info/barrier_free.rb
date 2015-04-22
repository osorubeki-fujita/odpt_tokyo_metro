class TokyoMetro::Required::All::Api::StationFacility::Info::BarrierFree < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "info" ) ,
      all_files_in_the_same_directory ,
      ServiceDetail.files ,
      Facility.files
    ]
  end

end