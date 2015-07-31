class TokyoMetro::Factory::Seed::Static::TwitterAccount::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TwitterAccount

  def set_optional_variables( var )
    @operator_info_or_railway_line_info_id = var
  end

  def hash_to_db
    {
      widget_id: @info.widget_id ,
      name: @info.account_name ,
      operator_info_or_railway_line_info_id: @operator_info_or_railway_line_info_id ,
      operator_info_or_railway_info_type: @info.db_class_of_parent_info
    }
  end

end
