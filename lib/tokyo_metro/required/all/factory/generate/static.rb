class TokyoMetro::Required::All::Factory::Generate::Static < TokyoMetro::Required

  def self.other_files
    [
      MetaClass.files ,
      Color.files ,
      TrainType.files
    ]
  end

end