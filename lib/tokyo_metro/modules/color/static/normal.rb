# インスタンス変数に色情報が定義されているクラスに対し、色の情報を取得するメソッドを提供するモジュール
module TokyoMetro::Modules::Color::Static::Normal

  # 背景の WebColor を返すメソッド
  # @return [String]
  def web_color
    get_web_color_of( @color )
  end

  # 背景の Red, Green, Blue の各成分の情報を括弧で囲んだ文字列にして返すメソッド
  # @return [String]
  def to_s_rgb_color_in_parentheses
    get_rgb_color_in_parentheses_of( @color )
  end

  # 背景色の R 成分の値を返すメソッド
  # @return [Integer]
  def red
    get_red_element_of( @color )
  end

  # 背景色の G 成分の値を返すメソッド
  # @return [Integer]
  def green
    get_green_element_of( @color )
  end

  # 背景色の B 成分の値を返すメソッド
  # @return [Integer]
  def blue
    get_blue_element_of( @color )
  end

end
