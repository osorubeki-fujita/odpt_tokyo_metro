class TokyoMetro::Required::All::Api::StationFacility::Info::BarrierFree::Facility::MetaClass::LinkForMobilityScootersAndStairLift < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [ "info" , "list" ].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end