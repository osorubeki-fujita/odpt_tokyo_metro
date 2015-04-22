class TokyoMetro::Required::All::Api::StationFacility < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    Info.files
  end

end