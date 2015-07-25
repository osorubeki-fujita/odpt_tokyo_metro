class TokyoMetro::Factory::Generate::Static::RailwayLine::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::OdptCommon::Modules::Time::Set

  def self.hash_keys
    [ :name_ja , :name_hira , :name_en , :codes , :operator , :index_in_operator , :colors , :start_on , :end_on , :twitter_widget_id , :twitter_account_name ]
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :name_ja , :name_hira , :name_en ] , make_array: true )
    super( hash_key_array: [ :twitter_widget_id , :twitter_account_name , :index_in_operator ] )

    @hash_for_making_variables[ :codes ] = codes
    @hash_for_making_variables[ :colors ] = color_instances
    @hash_for_making_variables[ :operator ] = operator_instance
    @hash_for_making_variables[ :start_on ] = set_time_of( @h[ :start_on ] , type: :start_on )
    @hash_for_making_variables[ :end_on ] = set_time_of( @h[ :end_on ] , type: :end_on )

    check_validity_of_codes_and_color
  end

  def codes
    _codes = @h[ :codes ]
    if _codes.present?
      return [ _codes ].flatten
    else
      return nil
    end
  end

  # 事業者のインスタンスを取得するメソッド
  # @return [::TokyoMetro::Static::Operator::Info]
  def operator_instance
    operator_info = ::TokyoMetro::Static.operator_infos[ @h[ :operator ] ]
    raise "Error: The operator is not defined." unless operator_info.present?
    return operator_info
  end

  # 色情報のインスタンスを取得するメソッド
  # @param color_base [Hash or ::Array<Hash>] 色情報のもととなるハッシュ（またはハッシュの配列）
  # @return [::TokyoMetro::Static::Color] 与えられた変数 color_base がハッシュの場合
  # @return [::Array <::TokyoMetro::Static::Color>] 与えられた変数 color_base がハッシュの配列の場合
  def color_instances
    color_base = @h[ :color ]
    if color_base.nil?
      nil
    elsif color_base.kind_of?( ::Hash )
      [ ::TokyoMetro::Static::Color.generate_from_hash( color_base ) ]
    elsif color_base.array? and color_base.all? { |i| i.kind_of?( ::Hash ) }
      color_base.map { | each_color | ::TokyoMetro::Static::Color::generate_from_hash( each_color ) }
    else
      raise "Error"
    end
  end

  def check_validity_of_codes_and_color
    _codes = @hash_for_making_variables[ :codes ]
    _colors = @hash_for_making_variables[ :colors ]
    if _codes.present? and _colors.present?
      # puts @same_as
      raise unless [ _codes , _colors ].all?( &:array? ) and _codes.length == _colors.length
    end
  end

end
