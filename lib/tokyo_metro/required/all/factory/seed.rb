class TokyoMetro::Required::All::Factory::Seed < TokyoMetro::Required

  def self.other_files
    [
      Reference.files ,
      Common.files ,
      Api.files ,
      Static.files
    ]
  end

end