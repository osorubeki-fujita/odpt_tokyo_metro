class TokyoMetro::Factory::Seed::Static::RailwayLine::Hash < TokyoMetro::Factory::Seed::Static::Operator::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine

  private

  def seed_optional_infos
    super()
    seed_railway_line_relations
  end

  def seed_instance_for_undefined_object
    @undefind_instance = self.class.db_instance_class.find_or_create_by(
      same_as: "odpt.Railway:Undefined" ,
      name_ja: "未定義" ,
      name_en: "Undefined" ,
      operator_info_id: ::Operator::Info.find_by( same_as: "odpt.Operator:Undefined" ).id ,
      index_in_operator: 1
    )
  end

  def seed_instance_for_color_and_code_of_undefined_object
    color_info_id = ::Design::Color::Info.find_or_create_by( hex_color: "\#999999" ).id
    code_instance = self.class.factory_for_seeding_code_infos.find_or_create_by(
      code: "NG" ,
      color_info_id: color_info_id ,
      numbering: false
    )

    self.class.db_instance_class_of_info_code_info.find_or_create_by(
      info_id: @undefind_instance.id ,
      code_id: code_instance.id ,
      index: 1
    )
  end

  def seed_railway_line_relations
    @array_to_seed.each.with_index(1) do | item , now_at |
      display_number( item , now_at )
      item.seed_railway_line_relations
    end
  end

end
