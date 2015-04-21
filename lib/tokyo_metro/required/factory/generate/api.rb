class TokyoMetro::Required::Factory::Generate::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" , "generate" , "api" )
  end

  def self.other_files
    [
      ::Dir.glob( "#{ top_file }/**.rb" ).sort ,
      MetaClass.files ,
      StationFacility.files
    ]
  end

end