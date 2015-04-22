class TokyoMetro::Required::All::Static < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      ExceptForTrainType.files ,
      TrainType.files
    ]
  end

end