class TokyoMetro::Factory::Seed::Static::RailwayLine::Hash < TokyoMetro::Factory::Seed::Static::Operator::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine

  private

  def seed_instance_for_escaping_undefined
    self.class.db_instance_class.find_or_create_by(
      same_as: "odpt.Railway:Undefined" ,
      name_ja: "未定義" ,
      name_en: "Undefined" ,
      operator_info_id: ::Operator::Info.find_by( same_as: "odpt.Operator:Undefined" ).id ,
      color: "\#999999" ,
      index_in_operator: 1 ,
      name_codes: "NG"
    )
  end

end
