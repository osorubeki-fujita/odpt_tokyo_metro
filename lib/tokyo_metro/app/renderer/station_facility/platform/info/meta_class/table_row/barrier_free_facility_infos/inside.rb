class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::BarrierFreeFacilityInfos::Inside < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::BarrierFreeFacilityInfos::MetaClass

  private

  def ul_class
    [ :inside_barrier_free_facility_infos_for_this_position , super() ].flatten
  end

  def li_class
    :inside_barrier_free_facility_info
  end

end