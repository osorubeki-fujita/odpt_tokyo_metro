class TokyoMetro::Required::All::Factory < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      Convert.files ,
      Generate.files ,
      Get.files ,
      Save.files ,
      Scss.files ,
      YamlStationList.files ,
      Seed.files ,
      Common.files ,
      BeforeDecorate.files ,
      Decorate.files
    ]
  end

end