class TokyoMetro::Factory::Generate::Static::Color::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal

  include ::TokyoMetro::ClassNameLibrary::Static::Color

  def self.info_class_for_this_class
    toplevel_class
  end

  def self.hash_keys_of_color
    [ :hex ] + rgb_keys
  end

  def self.rgb_keys
    [ :red , :green , :blue ]
  end

  def self.hash_keys
    hash_keys_of_color
  end

  private

  def variables
    color_variables
  end

  def color_variables
    variables_from_hash_keys( hash_key_array: self.class.hash_keys_of_color )
  end

  def set_values_to_hash_for_making_variables
    super

    # hex が定義されていて、red, green, blue（の一部）が未定義の場合
    if hex_color_defined? and !( all_rgb_defined? )
      set_rgb

   # red, green, blue がすべて定義されていて、hex が定義されていない場合
    elsif !( hex_color_defined? ) and all_rgb_defined?
      set_hex

    # hex, red, green, blue がすべて定義されている場合
    elsif hex_color_defined? and all_rgb_defined?
      check_validity_of_variables
    else
      raise "Error"
    end
  end

  # RGB の各成分が正当に定義されているか否かを判定するメソッド
  # @return [Boolean]
  def all_rgb_defined?
    rgb_array.all? { |i| i.integer? and i >= 0 and i <= 255 }
  end

  def hex_color_defined?
    @hash_for_making_variables[ :hex ].present?
  end

  def rgb_from_hex
    @hash_for_making_variables[ :hex ].to_rgb_color
  end

  def rgb_array
    self.class.rgb_keys.map { | element | @hash_for_making_variables[ element ] }
  end

  def hex_from_rgb
    "\#" + rgb_array.map( &:to_two_digit_hex ).join
  end

  # HexColor の情報をもとに RGB の成分の情報を取得するメソッド
  def set_rgb
    r , g , b = rgb_from_hex
    @hash_for_making_variables[ :red ] = r
    @hash_for_making_variables[ :green ] = g
    @hash_for_making_variables[ :blue ] = b
  end

  # RGB の成分の情報をもとに HexColor の情報を取得するメソッド
  def set_hex
    @hash_for_making_variables[ :hex ] = hex_from_rgb
  end

  # HexColor, RGB の各成分が矛盾なく設定されているか否かを確認するメソッド
  # @return [nil]
  def check_validity_of_variables
    unless rgb_from_hex == rgb_array
      str_ary = ::Array.new
      str_ary << "Error:"
      str_ary << "\[hexcolor\]"
      str_ary << @hash_for_making_variables[ :hex ]
      str_ary << "(#{ rgb_from_hex })"
      str_ary << "/"
      str_ary << "\[rgb\]"
      str_ary << rgb_array.map( &:to_s ).join( " , " )
      str_ary << "(#{ hex_from_rgb })"

      raise str_ary.map( &:to_s ).join( " " )
    end

    return nil
  end

end
