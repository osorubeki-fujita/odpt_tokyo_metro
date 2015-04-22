class TokyoMetro::Required::All::Factory::Generate::Api < TokyoMetro::Required

  def self.other_files
    [
      all_files_in_the_same_directory ,
      MetaClass.files ,
      StationFacility.files
    ]
  end

end