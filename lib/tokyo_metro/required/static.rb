class TokyoMetro::Required::Static < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  # static / 変化のない（or 非常に少ない）情報を扱うクラス
  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "static" )
  end

  def self.other_files
    [
      ExceptForTrainType.files ,
      TrainType.files
    ]
  end

end