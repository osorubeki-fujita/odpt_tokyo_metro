class TokyoMetro::Factory::Seed::Static::TrainType::Custom::Main::Hash < TokyoMetro::Factory::Seed::Static::Operator::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::Custom::Main

  def seed_instance_for_escaping_undefined
    train_type_in_api = ::Train::Type::InApi.find_by( same_as: "odpt.TrainType:TokyoMetro.Unknown" )

    design_color_info_id = ::Design::Color::Info.find_or_create_by( hex_color: "\#ffffff" ).id
    design_bgcolor_info_id = ::Design::Color::Info.find_or_create_by( hex_color: "\#666666" ).id

    h = {
      same_as: "custom.TrainType:Undefined" ,
      note: "未定義" ,
      in_api_id: train_type_in_api.id ,
      railway_line_info_id: ::Railway::Line::Info.find_by( same_as: "odpt.Railway:Undefined" ).id ,
      color_info_id: self.class.db_instance_class_of_color_info.find_or_create_by( color_info_id: design_color_info_id , bgcolor_info_id: design_bgcolor_info_id ).id
    }
    self.class.db_instance_class.find_or_create_by(h)
  end

end
