class TokyoMetro::Required::All::Factory::Convert::Common::Api::MetaClass < TokyoMetro::Required

  def self.other_files
    [
      Fundamental.files ,
      TrainInfos.files
    ]
  end

end
