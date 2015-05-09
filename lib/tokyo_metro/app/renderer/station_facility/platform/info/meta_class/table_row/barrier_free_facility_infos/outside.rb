class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::BarrierFreeFacilityInfos::Outside < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::BarrierFreeFacilityInfos::MetaClass

  private

  def ul_class
    [ :outside_barrier_free_facility_infos_for_this_position , super() ].flatten
  end

  def li_class
    :outside_barrier_free_facility_info
  end

end