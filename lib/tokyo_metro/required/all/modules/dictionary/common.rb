class TokyoMetro::Required::All::Modules::Dictionary::Common < TokyoMetro::Required

  def self.other_files
    [ RailwayLine.files , Station.files ]
  end

end
