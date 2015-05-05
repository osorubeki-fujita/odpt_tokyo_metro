class TokyoMetro::Required::All::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( top_file , "meta_class" ) ,
      BarrierFreeFacilityInfos.files
    ]
  end

end