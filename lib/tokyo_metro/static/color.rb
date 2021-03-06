# 鉄道事業者・路線・種別の色の情報を扱うモジュール
class TokyoMetro::Static::Color

  include ::TokyoMetro::ClassNameLibrary::Static::Color
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info

  # Constructor
  # @param hex [String] HexColor
  # @param red [Integer] R 成分の値
  # @param green [Integer] G 成分の値
  # @param blue [Integer] B 成分の値
  def initialize( hex , red , green , blue )
    @hex = hex
    @red = red
    @green = green
    @blue = blue
  end

  # HexColor を取得するメソッド
  # @return [String]
  attr_reader :hex
  # R 成分の値を返すメソッド
  # @return [Integer]
  attr_reader :red
  # G 成分の値を返すメソッド
  # @return [Integer]
  attr_reader :green
  # B 成分の値を返すメソッド
  # @return [Integer]
  attr_reader :blue

  alias :hex_color :hex

# @!group 文字列への変換

  # インスタンスの情報を文字列に変換して返すメソッド
  # @param indent [Integer (>=0)] インデントの幅
  # @return [String]
  def to_s( indent = 0 )
    " " * indent + "#{@hex} (#{ self.to_a_rgb.join( " , " ) })"
  end

  # インスタンスの情報を CSV 出力用の文字列（カンマ区切り）にして返すメソッド
  # @return [String]
  def to_csv
    self.to_a.join(",")
  end

  # Red, Green, Blue の各成分の情報を括弧で囲んだ文字列にして返すメソッド
  # @return [String]
  def to_s_rgb_color_in_parentheses
    "( " + to_a_rgb.join( " , " ) + " )"
  end

# @!group 色情報の取得

  # Red, Green, Blue の各成分を配列にして返すメソッド
  # @return [::Array <Integer>]
  def to_a_rgb
    [ @red , @green , @blue ]
  end

  # HexColor, Red, Green, Blue の各成分を配列にして返すメソッド
  # @return [::Array <Integer>]
  def to_a
    [ @hex ] + self.to_a_rgb
  end

# @!endgroup

end
