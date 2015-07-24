class TokyoMetro::Factory::Generate::Static::Operator::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    [
      :name_ja , :name_ja_short , :name_en , :name_en_short , :index ,
      :operator_code , :numbering ,
      :railway_line_code_shape , :railway_line_code_stroke_width_setting , :railway_line_code_text_weight , :railway_line_code_text_size_setting ,
      :station_code_shape , :station_code_stroke_width_setting , :station_code_text_weight , :station_code_text_size_setting ,
      :color ,
      :twitter_widget_id , :twitter_account_name
    ]
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :name_ja , :name_en ] , make_array: true )
    super( hash_key_array: [ :name_ja_short , :name_en_short , :index ] )

    super( hash_key_array: [ :operator_code , :numbering ] )

    super( hash_key_array: [ :railway_line_code_shape , :railway_line_code_stroke_width_setting , :railway_line_code_text_weight , :railway_line_code_text_size_setting ] )
    super( hash_key_array: [ :station_code_shape , :station_code_stroke_width_setting , :station_code_text_weight , :station_code_text_size_setting ] )

    super( hash_key_array: [ :color ] )
    super( hash_key_array: [ :twitter_widget_id , :twitter_account_name ] )
    super( hash_key_array: :numbering , boolean: true )

    unless has_color?
      raise "Error"
    end

    @hash_for_making_variables[ :color ] = ::TokyoMetro::Static::Color::generate_from_hash( @h[ :color ] )

    if has_number? and !( has_railway_line_code? ) and has_no_station_code?
      @hash_for_making_variables[ :railway_line_code_shape ] = "none"
    end
  end

  def has_color?
    @hash_for_making_variables[ :color ].present?
  end

  def has_number?
    @hash_for_making_variables[ :numbering ]
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

end
