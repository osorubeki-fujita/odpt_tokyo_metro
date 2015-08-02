class TokyoMetro::Factory::Seed::Static::Operator::Info::AdditionalInfos < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  private

  def set_optional_variables( operator_info_id )
    @operator_info_id = operator_info_id
  end

  def hash_to_db
    h = ::Hash.new
    h[ :info_id ] = @operator_info_id
    h[ :code ] = @info.additional_infos.code
    h[ :numbering ] = @info.numbering
    h[ :color_info_id ] = color_info_id

    # [
      # :railway_line_code_shape , :railway_line_code_stroke_width_setting , :railway_line_code_text_weight , :railway_line_code_text_size_setting ,
      # :station_code_shape , :station_code_stroke_width_setting , :station_code_text_weight , :station_code_text_size_setting
    # ].each do | column |
      # h[ column ] = @info.send( column )
    # end

    h
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_additional_info
  end

  def color_info_id
    ::Design::Color::Info.find_or_create_by( hex_color: @info.additional_infos.color.hex ).id
  end

  def railway_line_code_info_id
    return nil
  end

end
