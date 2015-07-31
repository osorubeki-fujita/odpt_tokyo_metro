class TokyoMetro::Factory::Generate::Static::Operator::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal

  include ::TokyoMetro::ClassNameLibrary::Static::Operator
  include ::TokyoMetro::Factory::Generate::Static::MetaClass::Polymorphic::TwitterAccount

  def self.hash_keys
    [ :name , :index , :additional_infos , :twitter_account_info ]
  end

  private

  def set_values_to_hash_for_making_variables
    @hash_for_making_variables[ :name ] = name_instance
    @hash_for_making_variables[ :additional_infos ] = additional_infos
    super( hash_key_array: [ :index ] )
    set_twitter_account_info
  end

  def name_instance
    ::TokyoMetro::Static::Operator::Info::Name.generate_from_hash( @h[ :name ] )
  end

  def additional_infos
    ::TokyoMetro::Static::Operator::Info::AdditionalInfos.generate_from_hash( @h[ :additional_infos ] )
  end

end

__END__

  super( hash_key_array: [ :operator_code , :numbering ] )

  super( hash_key_array: [ :railway_line_code_shape , :railway_line_code_stroke_width_setting , :railway_line_code_text_weight , :railway_line_code_text_size_setting ] )
  super( hash_key_array: [ :station_code_shape , :station_code_stroke_width_setting , :station_code_text_weight , :station_code_text_size_setting ] )

  super( hash_key_array: [ :color ] )
  super( hash_key_array: :numbering , boolean: true )

  if has_number? and !( has_railway_line_code? ) and has_no_station_code?
    @hash_for_making_variables[ :railway_line_code_shape ] = "none"
  end

end

def has_railway_line_code?
  @hash_for_making_variables[ :railway_line_code_shape ].present?
end

def has_no_railway_line_code?
  @hash_for_making_variables[ :railway_line_code_shape ] == "none"
end

def has_no_station_code?
  @hash_for_making_variables[ :station_code_shape ] == "none"
end
