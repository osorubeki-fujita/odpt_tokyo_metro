class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::BarrierFreeFacilityInfos::MetaClass < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::MetaClass

  private

  def set_proc_for_display
    @proc_for_display = ::Proc.new { | info | info.decorate.render_in_platform_info }
  end

end