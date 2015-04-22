class TokyoMetro::Required::All::Factory::Seed::Api::StationFacility::Info < TokyoMetro::Required

  def self.other_files
    [ Common.files , BarrierFree.files , Platform.files ]
  end

end