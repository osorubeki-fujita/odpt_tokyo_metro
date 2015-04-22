class TokyoMetro::Required::All::Factory::Seed::Api::StationFacility < TokyoMetro::Required

  def self.other_files
    [ List.files , Info.files ]
  end

end