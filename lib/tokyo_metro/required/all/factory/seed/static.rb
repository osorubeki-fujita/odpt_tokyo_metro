class TokyoMetro::Required::All::Factory::Seed::Static < TokyoMetro::Required

  def self.other_files
    [
      MetaClass.files ,
      Operator.files ,
      RailwayLine.files ,
      Station.files
    ]
  end

end