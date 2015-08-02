class TokyoMetro::Factory::Seed::Static::Operator::Info::AdditionalInfos < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  private

  def set_optional_variables( args )
    raise unless args.length == 1
    @operator_info_id = args.first
  end

  def hash_to_db
    h = ::Hash.new
    h[ :info_id ] = @operator_info_id
    h[ :code ] = @info.code
    h[ :numbering ] = @info.numbering

    h[ :color_info_id ] = color_info_id
    h[ :railway_line_code_info_id ] = railway_line_code_info_id
    h[ :station_code_info_id ] = station_code_info_id

    h
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_additional_info
  end

  def color_info_id
    ::Design::Color::Info.find_or_create_by( hex_color: @info.color.hex ).id
  end

  def railway_line_code_info_id
    ::Operator::CodeInfo.find_or_create_by( @info.code_settings.railway_line.to_h ).id
  end

  def station_code_info_id
    ::Operator::CodeInfo.find_or_create_by( @info.code_settings.station.to_h ).id
  end

end
