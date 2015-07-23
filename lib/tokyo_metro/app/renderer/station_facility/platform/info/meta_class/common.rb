module TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::Common

  def railway_line_name_ja
    raise "Error: The method \'#{ __method__ }\' is not defined yet in this class."
  end

  def railway_line_name_en
    raise "Error: The method \'#{ __method__ }\' is not defined yet in this class."
  end

  def railway_line_css_class
    raise "Error: The method \'#{ __method__ }\' is not defined yet in this class."
  end

  def tab_name
    "platform_info_#{ railway_line_css_class }_line"
  end

  # @!group 方面別の情報

  def has_railway_direction_infos?
    @platform_infos.any? { | info | info.railway_direction_id.present? }
  end

  # @!group 車両編成の情報

  def car_composition_types
    @platform_infos.map( &:car_composition ).uniq
  end

  def has_one_car_composition_type?
    car_composition_types.length == 1
  end

  def max_car_composition
    car_composition_types.max
  end

  # @!group 含まれている情報の判定

  def has_transfer_infos?
    @platform_infos.any? { | info | info.platform_transfer_infos.present? }
  end

  def has_barrier_free_facility_infos?
    @platform_infos.any? { | info | info.barrier_free_facility_infos.present? }
  end

  def has_surrounding_area_infos?
    @platform_infos.any? { | info | info.surrounding_areas.present? }
  end

  # @!group 含まれている情報

  def transfer_infos
    @platform_infos.map( &:platform_transfer_infos )
  end

  def barrier_free_facility_infos
    @platform_infos.map { | info |
      info.barrier_free_facility_infos.includes( :located_area , :type , :service_detail_infos )
    }
  end

  def surrounding_area_infos
    @platform_infos.map( &:surrounding_areas )
  end

  # @!endgroup

  private

  def set_railway_line_info( railway_line_infos )
    raise "Error: The method \'#{ __method__ }\' is not defined yet in this class \"#{ self.class }\"."
  end

  def h_locals
    super.merge({
      info: self
    })
  end

end
