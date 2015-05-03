class TokyoMetro::Required::All::Factory::Convert::Customize < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      Api.files
    ]
  end

end