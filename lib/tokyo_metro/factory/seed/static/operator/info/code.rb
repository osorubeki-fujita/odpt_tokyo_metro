class TokyoMetro::Factory::Seed::Static::Operator::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  private

  def set_optional_variables( operator_info_id )
    @operator_info_id = operator_info_id
  end

  def hash_to_db
    h = ::Hash.new
    h[ :info_id ] = @operator_info_id
    h[ :code ] = @info.operator_code

    h[ :color ] = @info.hex_color

    [
      :numbering ,
      :railway_line_code_shape , :railway_line_code_stroke_width_setting , :railway_line_code_text_weight , :railway_line_code_text_size_setting ,
      :station_code_shape , :station_code_stroke_width_setting , :station_code_text_weight , :station_code_text_size_setting
    ].each do | column |
      h[ column ] = @info.send( column )
    end

    h
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_code
  end

end
