class TokyoMetro::Required::All::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    ServiceDetail.files
  end

end