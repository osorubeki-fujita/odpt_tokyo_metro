class TokyoMetro::Factory::Seed::Static::RailwayLine::Info::AdditionalInfo < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::DcDate

  ADDITIONAL_INFO_COLUMNS = [ :id_urn , :geo_json , :dc_date ]

  private

  def set_optional_variables( info_id )
    @info_id = info_id
    @railway_line_info_in_api = ::TokyoMetro::Api.railway_lines.find{ | railway_line | railway_line.same_as?( @info.same_as ) }
  end

  def seed
    if to_seed?
      super()
    end
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_additional_info
  end

  def to_seed?
    @info.operated_by_tokyo_metro? and has_infos_in_railway_line_info_in_api?
  end

  def has_infos_in_railway_line_info_in_api?
    @railway_line_info_in_api.present? and ADDITIONAL_INFO_COLUMNS.map { | attr_name | @railway_line_info_in_api.send( attr_name ) }.any?( &:present? )
  end

  def hash_to_db
    h = ::Hash.new
    h[ :info_id ] = @info_id
    ADDITIONAL_INFO_COLUMNS.each do | attr_name |
      h[ attr_name ] = @railway_line_info_in_api.send( attr_name )
    end
    h[ :dc_date ] = dc_date( h[ :dc_date ] )
    h
  end

  def dc_date( var )
    if var.present?
      super( create_from: var )
    else
      nil
    end
  end

end
