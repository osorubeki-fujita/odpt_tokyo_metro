class TokyoMetro::Required::All::Api::StationFacility::Info < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      all_files_in_the_same_directory ,
      BarrierFree.files ,
      Platform.files
    ]
  end

end