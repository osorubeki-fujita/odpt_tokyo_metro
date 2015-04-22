class TokyoMetro::Required::All::Factory::Generate::Api < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "generate" , "api" )
  end

  def self.other_files
    [
      ::Dir.glob( "#{ top_file }/**.rb" ).sort ,
      MetaClass.files ,
      StationFacility.files
    ]
  end

end