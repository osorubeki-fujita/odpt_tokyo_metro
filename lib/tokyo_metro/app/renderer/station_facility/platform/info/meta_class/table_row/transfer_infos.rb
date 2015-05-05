class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::TransferInfos < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::TableRow::MetaClass

  private

  def set_proc_for_dicision
    @proc_for_dicision = ::Proc.new { | infos | infos.map( &:to_array_of_displayed_infos ) }
  end

  def ul_class
    :transfer_infos_for_this_position
  end

  def li_class
    ::Proc.new { | info |
      [ :transfer_info , info.railway_line.css_class_name ]
    }
  end

end