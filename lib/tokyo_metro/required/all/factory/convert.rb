class TokyoMetro::Required::All::Factory::Convert < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      Common.files ,
      Customize.files
    ]
  end

end