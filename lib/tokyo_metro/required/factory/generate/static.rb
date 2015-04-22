class TokyoMetro::Required::Factory::Generate::Static < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "static" )
  end

  def self.other_files
    [
      MetaClass.files ,
      Color.files ,
      TrainType.files
    ]
  end

end