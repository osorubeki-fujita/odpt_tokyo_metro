# インスタンス変数に背景色情報が定義されているクラスに対し、背景色の情報を取得するメソッドを提供するモジュール
module TokyoMetro::Modules::Color::Static::Background

  # 背景の WebColor を返すメソッド
  # @return [String]
  def bg_web_color
    get_web_color_of( @bgcolor )
  end

  # 背景の Red, Green, Blue の各成分の情報を括弧で囲んだ文字列にして返すメソッド
  # @return [String]
  def to_s_rgb_bg_color_in_parentheses
    get_rgb_color_in_parentheses_of( @bgcolor )
  end

  # 背景色の R 成分の値を返すメソッド
  # @return [Integer]
  def bg_red
    get_red_element_of( @bgcolor )
  end

  # 背景色の G 成分の値を返すメソッド
  # @return [Integer]
  def bg_green
    get_green_element_of( @bgcolor )
  end

  # 背景色の B 成分の値を返すメソッド
  # @return [Integer]
  def bg_blue
    get_blue_element_of( @bgcolor )
  end

end
