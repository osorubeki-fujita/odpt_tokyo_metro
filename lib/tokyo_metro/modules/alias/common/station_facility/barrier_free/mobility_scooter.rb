module TokyoMetro::Modules::Alias::Common::StationFacility::BarrierFree::MobilityScooter

  # もともと定義されているメソッドは mobility_scooter_accessible, is_available_to_mobility_scooter

  # @note mobility_scooter_accessible の別名として、mobility_scooter_accessible? を定義
  def mobility_scooter_accessible?
    mobility_scooter_accessible
  end

  # @note is_available_to_mobility_scooter の別名として、available_to_mobility_scooter? を定義
  def available_to_mobility_scooter?
    is_available_to_mobility_scooter
  end

end
