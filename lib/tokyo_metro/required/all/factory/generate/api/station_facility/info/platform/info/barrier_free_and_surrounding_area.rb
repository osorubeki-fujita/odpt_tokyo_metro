class TokyoMetro::Required::All::Factory::Generate::Api::StationFacility::Info::Platform::Info::BarrierFreeAndSurroundingArea < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    ::File.join( top_file , "info" )
  end

end