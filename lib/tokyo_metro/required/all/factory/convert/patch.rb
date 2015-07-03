class TokyoMetro::Required::All::Factory::Convert::Patch < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      ForString.files ,
      Api.files
    ]
  end

end
