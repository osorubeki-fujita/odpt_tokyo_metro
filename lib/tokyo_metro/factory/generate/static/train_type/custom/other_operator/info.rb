class TokyoMetro::Factory::Generate::Static::TrainType::Custom::OtherOperator::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::WithAttrSameAs

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::Custom::OtherOperator
  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  TITLE = "TrainTypeOtherOperator"

  def self.hash_keys
    hash_keys_for_fundamental_infos + hash_keys_for_operator_and_railway_line
  end

  def self.hash_keys_for_fundamental_infos
    [ :train_type , :bgcolor , :color ]
  end

  def self.hash_keys_for_operator_and_railway_line
    [ :operator , :railway_line ]
  end

  private

  def before_setting_values_to_hash_for_making_variables
    check_validity_of_hash_keys
  end

  def check_validity_of_hash_keys
    invalid_keys = @h.keys.map( &:to_s ) - ( self.class.hash_keys + [ :ref ] ).map( &:to_s )

    if invalid_keys.present?
      invalid_keys_to_s = invalid_keys.join( ", " )
      raise invalid_keys_to_s
    end
    return nil
  end

  def inspect_title
    puts "○ #{TITLE} #{ @same_as }"
  end

  def variables_from_hash_keys
    hash_keys = self.class.hash_keys_for_fundamental_infos + self.class.hash_keys_for_operator_and_railway_line
    super( hash_key_array: hash_keys )
  end

  def set_values_to_hash_for_making_variables
    @hash_for_making_variables[ :train_type ] = train_type

    [ :bgcolor , :color ].each do | key_name |
      @hash_for_making_variables[ key_name ] = color_info( key_name )
    end

    super( hash_key_array: [ :operator , :railway_line ] )
  end

  def train_type
    train_type = get_hash_value( :train_type )
    unless train_type.string?
      puts "h: " + @h.to_s
      puts "keys: " + @h.keys.to_s
      puts "Class: " + @h.keys.first.class
      raise "Error: \"#{ train_type.to_s }\" (#{train_type.class.name}) is not valid. (Key: :train_type )"
    end
    t = ::TokyoMetro::Static.train_types_in_api[ train_type ]
    if t.nil?
      raise "Error: #{ train_type }"
    end
    t
  end

  def color_info( key_name )
    info = get_hash_value( key_name )
    unless info.kind_of?( ::Hash )
      raise "Error: #{ info.to_s } (key: #{ key_name } / class: #{ info.class.name })"
    end

    case info.keys
    # キーに ref のみが指定されている場合
    when [ "ref" ]
      # 参照のためのキー
      key_for_reference = info[ "ref" ]
      # 標準色として定義された色を取得する
      color = ::TokyoMetro::Static.train_types_color[ key_for_reference ]
      unless color.instance_of?( ::TokyoMetro::Static::TrainType::Color::Info )
        raise "Error: #{color.class.name}"
      end
      color

    # キーに line_color のみが指定されている場合
    when [ "line_color" ]
      key_of_line_color = info[ "line_color" ]
      # ラインカラーを取得する
      ::TokyoMetro::Static.railway_lines.select_main_color( key_of_line_color )

    # キーに hex, red, green, blue がそれぞれ指定されている場合
    when [ "hex" , "red" , "green" , "blue" ]
      # 新たに色情報のインスタンスを作成する
      ::TokyoMetro::Static::Color.generate_from_hash( info )
    else
      raise "Error"
    end
  end

  def check_varidity_of_referenced_info( info )
    super( info , include_ancestors: true )
  end

end
