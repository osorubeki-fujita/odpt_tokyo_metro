class TokyoMetro::Required::Factory < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  # factory / Facetory Pattern
  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "factory" )
  end

  def self.other_files
    [
      Generate.files ,
      Get.files ,
      Save.files ,
      Scss.files ,
      YamlStationList.files ,
      Seed.files ,
      Common.files ,
      Decorate.files
    ]
  end

end