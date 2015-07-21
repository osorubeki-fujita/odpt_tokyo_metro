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
      Db.files ,
      #
      Common.files ,
      #
      Seed.files ,
      BeforeSeed.files ,
      #
      Decorate.files ,
      BeforeDecorate.files ,
      Design.files
    ]
  end

end
