class TokyoMetro::Factory::Seed::Static::Operator::Hash < TokyoMetro::Factory::Seed::Static::MetaClass::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  private

  def seed_optional_infos
    seed_instance_for_escaping_undefined
  end

  def seed_instance_for_escaping_undefined
    seed_instance_for_undefined_object
    seed_instance_for_color_and_code_of_undefined_object
  end

  def seed_instance_for_undefined_object
    @undefined_instance = self.class.db_instance_class.find_or_create_by(
      same_as: "odpt.Operator:Undefined" ,
      name_ja: "未定義" ,
      name_hira: "みていぎ" ,
      name_en: "Undefined" ,
      index: 9999
    )
  end

  def seed_instance_for_color_and_code_of_undefined_object
    color_info_id = ::Design::Color::Info.find_or_create_by( hex_color: "\#999999" ).id

    railway_line_code_info_id = self.class.db_instance_class_of_code_info.find_or_create_by(
      shape: "filled_rounded_square" ,
      text_weight: "bold" ,
      text_size: "normal"
    ).id

    station_code_info_id = self.class.db_instance_class_of_code_info.find_or_create_by(
      shape: "stroked_rounded_square" ,
      stroke_width: "normal" ,
      text_weight: "normal" ,
      text_size: "normal"
    ).id

    self.class.db_instance_class_of_additional_info.find_or_create_by(
      info_id: @undefined_instance.id ,
      color_info_id: color_info_id ,
      numbering: false ,
      code: "NG" ,
      railway_line_code_info_id: railway_line_code_info_id ,
      station_code_info_id: station_code_info_id
    )
  end

end
