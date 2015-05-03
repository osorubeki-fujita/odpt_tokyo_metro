class TokyoMetro::Required::All::Factory::Convert::Common::Api < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      StationInfos.files
    ]
  end

end