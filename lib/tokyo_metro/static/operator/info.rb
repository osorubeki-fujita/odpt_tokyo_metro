# 個別の鉄道事業者の情報を扱うクラス
class TokyoMetro::Static::Operator::Info < TokyoMetro::Static::Fundamental::Info

  include ::OdptCommon::Modules::Polymorphic::Operator

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  include ::OdptCommon::Modules::Name::Static::Fundamental::ForInspection
  include ::OdptCommon::Modules::Name::Common::Fundamental::GetMainName

  include ::OdptCommon::Modules::Name::Common::Operator::Info
  include ::TokyoMetro::Modules::Name::Common::Operator::CssClass

  include ::TokyoMetro::Modules::Decision::Common::Fundamental::CompareBase

  include ::OdptCommon::Modules::Decision::Common::Operator::Name
  include ::TokyoMetro::Modules::Decision::Common::Operator::Name

  include ::OdptCommon::Modules::MethodMissing::Decision::Common::Operator

# @!group Constructor

  # Constructor
  # @param same_as [String] キー
  # @param name [::TokyoMetro::Static::Operator::Info::Name]
  # @param index [Integer] 事業者の番号（整列のための定義）
  def initialize( same_as , name , index , additional_infos , twitter_account_info )
    @same_as = same_as
    @name = name
    @index = index

    @additional_infos = additional_infos
    @twitter_account_info = twitter_account_info
  end

  attr_reader :name
  attr_reader :additional_infos
  attr_reader :twitter_account_info

# @!group 鉄道事業者の ID、番号に関するメソッド

  # 鉄道事業者の ID キー
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as }
  #   =>
  #   odpt.Operator:TokyoMetro
  #   odpt.Operator:Toei
  #   odpt.Operator:ToeiNipporiToneri
  #   odpt.Operator:Toden
  #   odpt.Operator:JR-East
  #   odpt.Operator:JR-Central
  #   odpt.Operator:Tokyu
  #   odpt.Operator:YokohamaMinatomiraiRailway
  #   odpt.Operator:Odakyu
  #   odpt.Operator:HakoneTozan
  #   odpt.Operator:Seibu
  #   odpt.Operator:Tobu
  #   odpt.Operator:SaitamaRailway
  #   odpt.Operator:ToyoRapidRailway
  #   odpt.Operator:Keio
  #   odpt.Operator:Keisei
  #   odpt.Operator:MIR
  #   odpt.Operator:Yurikamome
  #   odpt.Operator:TWR
  attr_reader :same_as

  # 鉄道事業者の番号（整列のための定義）
  # @return [Numeric]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.index.to_s.rjust(2) }
  #   =>
  #   odpt.Operator:TokyoMetro         :  1
  #   odpt.Operator:Toei               :  2
  #   odpt.Operator:ToeiNipporiToneri  :  3
  #   odpt.Operator:Toden              :  4
  #   odpt.Operator:JR-East            :  5
  #   odpt.Operator:JR-Central         :  6
  #   odpt.Operator:Tokyu              :  7
  #   odpt.Operator:YokohamaMinatomiraiRailway : 7.1
  #   odpt.Operator:Odakyu             :  8
  #   odpt.Operator:HakoneTozan        : 8.1
  #   odpt.Operator:Seibu              :  9
  #   odpt.Operator:Tobu               : 10
  #   odpt.Operator:SaitamaRailway     : 11
  #   odpt.Operator:ToyoRapidRailway   : 12
  #   odpt.Operator:Keio               : 13
  #   odpt.Operator:Keisei             : 14
  #   odpt.Operator:MIR                : 15
  #   odpt.Operator:Yurikamome         : 16
  #   odpt.Operator:TWR                : 17
  attr_reader :index

  # @!group 鉄道事業者の名称に関するメソッド (1) - インスタンス変数 正式名称

  # 鉄道事業者の事業者の名称（日本語、正式名称）
  # @return [::Array <::String>]
  # @note
  #  配列は、「都営地下鉄」（東京都交通局）、「都電」（東京都交通局）、「東急電鉄」（東京急行電鉄）、「つくばエクスプレス」（首都圏新都市鉄道）のように、事業者名よりも用いられることの多い（と思われる）事業名や別名、公式にも使われる略称などが存在する場合に用いる。
  #  なお、使用頻度が多いと思われる方が配列の先頭に来るよう定義する。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_ja.to_s }
  #   =>
  #   odpt.Operator:TokyoMetro         : ["東京メトロ", "東京地下鉄"]
  #   odpt.Operator:Toei               : ["都営地下鉄", "東京都交通局"]
  #   odpt.Operator:ToeiNipporiToneri  : ["都営", "東京都交通局"]
  #   odpt.Operator:Toden              : ["都電", "東京都交通局"]
  #   odpt.Operator:JR-East            : ["JR東日本", "東日本旅客鉄道"]
  #   odpt.Operator:JR-Central         : ["JR東海", "東海旅客鉄道"]
  #   odpt.Operator:Tokyu              : ["東急電鉄", "東京急行電鉄"]
  #   odpt.Operator:YokohamaMinatomiraiRailway : ["横浜高速鉄道"]
  #   odpt.Operator:Odakyu             : ["小田急電鉄"]
  #   odpt.Operator:HakoneTozan        : ["箱根登山鉄道"]
  #   odpt.Operator:Seibu              : ["西武鉄道"]
  #   odpt.Operator:Tobu               : ["東武鉄道"]
  #   odpt.Operator:SaitamaRailway     : ["埼玉高速鉄道"]
  #   odpt.Operator:ToyoRapidRailway   : ["東葉高速鉄道"]
  #   odpt.Operator:Keio               : ["京王電鉄"]
  #   odpt.Operator:Keisei             : ["京成電鉄"]
  #   odpt.Operator:MIR                : ["つくばエクスプレス", "首都圏新都市鉄道"]
  #   odpt.Operator:Yurikamome         : ["ゆりかもめ"]
  #   odpt.Operator:TWR                : ["りんかい線", "東京臨海高速鉄道"]
  def name_ja
    @name.ja
  end

  # 鉄道事業者の事業者の名称（ローマ字表記、正式名称）
  # @return [::Array <::String>]
  # @note 配列を使用する基準については {#name_ja} を参照のこと。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_en.to_s }
  #   =>
  #   odpt.Operator:TokyoMetro         : ["Tokyo Metro"]
  #   odpt.Operator:Toei               : ["Toei Subway", "Bureau of Transportation Tokyo Metropolitan Government"]
  #   odpt.Operator:ToeiNipporiToneri  : ["Toei", "Bureau of Transportation Tokyo Metropolitan Government"]
  #   odpt.Operator:Toden              : ["Toden", "Bureau of Transportation Tokyo Metropolitan Government"]
  #   odpt.Operator:JR-East            : ["JR East", "East Japan Railway Company"]
  #   odpt.Operator:JR-Central         : ["JR Central", "Central Japan Railway Company"]
  #   odpt.Operator:Tokyu              : ["Tokyu Corporation"]
  #   odpt.Operator:YokohamaMinatomiraiRailway : ["Yokohama Minatomirai Railway Company"]
  #   odpt.Operator:Odakyu             : ["Odakyu Electric Railway"]
  #   odpt.Operator:HakoneTozan        : ["Hakone Tozan Railway"]
  #   odpt.Operator:Seibu              : ["Seibu Railway"]
  #   odpt.Operator:Tobu               : ["Tobu Railway"]
  #   odpt.Operator:SaitamaRailway     : ["Saitama Railway"]
  #   odpt.Operator:ToyoRapidRailway   : ["Toyo Rapid Railway"]
  #   odpt.Operator:Keio               : ["Keio Corporation"]
  #   odpt.Operator:Keisei             : ["Keisei Electric Railway"]
  #   odpt.Operator:MIR                : ["Tsukuba Express", "MIR", "Metropolitan Intercity Railway"]
  #   odpt.Operator:Yurikamome         : ["Yurikamome"]
  #   odpt.Operator:TWR                : ["Rinkai Line", "TWR", "Tokyo Waterfront Area Rapid Transit"]
  def name_en
    @name.en
  end

  # @!group 鉄道事業者の名称に関するメソッド (2) - インスタンス変数 略称・表示用

  # 鉄道事業者の事業者の名称（日本語、略称・表示用）
  # @return [::String or nil]
  # @note 東京メトロに対しては nil を返す。
  # @note 日暮里・舎人ライナー、都電に対しては nil を返す。
  # @note JR各社については「JR」のみを返す。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_ja_short }
  #   =>
  #   odpt.Operator:TokyoMetro         : (nil)
  #   odpt.Operator:Toei               : 都営
  #   odpt.Operator:ToeiNipporiToneri  : (nil)
  #   odpt.Operator:Toden              : (nil)
  #   odpt.Operator:JR-East            : JR
  #   odpt.Operator:JR-Central         : JR
  #   odpt.Operator:Tokyu              : 東急
  #   odpt.Operator:YokohamaMinatomiraiRailway : (nil)
  #   odpt.Operator:Odakyu             : 小田急
  #   odpt.Operator:HakoneTozan        : 箱根登山
  #   odpt.Operator:Seibu              : 西武
  #   odpt.Operator:Tobu               : 東武
  #   odpt.Operator:SaitamaRailway     : (nil)
  #   odpt.Operator:ToyoRapidRailway   : (nil)
  #   odpt.Operator:Keio               : 京王
  #   odpt.Operator:Keisei             : 京成
  #   odpt.Operator:MIR                : (nil)
  #   odpt.Operator:Yurikamome         : (nil)
  #   odpt.Operator:TWR                : (nil)
  def name_ja_short
    @name.ja_short
  end

  # 鉄道事業者の事業者の名称（ローマ字表記、略称・表示用）
  # @return [::String or nil]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_en_short }
  #   =>
  #   odpt.Operator:TokyoMetro         : (nil)
  #   odpt.Operator:Toei               : Toei
  #   odpt.Operator:ToeiNipporiToneri  : (nil)
  #   odpt.Operator:Toden              : (nil)
  #   odpt.Operator:JR-East            : JR
  #   odpt.Operator:JR-Central         : JR
  #   odpt.Operator:Tokyu              : Tokyu
  #   odpt.Operator:YokohamaMinatomiraiRailway : (nil)
  #   odpt.Operator:Odakyu             : Odakyu
  #   odpt.Operator:HakoneTozan        : Hakone Tozan
  #   odpt.Operator:Seibu              : Seibu
  #   odpt.Operator:Tobu               : Tobu
  #   odpt.Operator:SaitamaRailway     : (nil)
  #   odpt.Operator:ToyoRapidRailway   : (nil)
  #   odpt.Operator:Keio               : Keio
  #   odpt.Operator:Keisei             : Keisei
  #   odpt.Operator:MIR                : (nil)
  #   odpt.Operator:Yurikamome         : (nil)
  #   odpt.Operator:TWR                : (nil)
  def name_en_short
    @name.en_short
  end

# @!group 鉄道事業者の駅番号・路線番号に関するメソッド

  # @return [Boolean] 駅ナンバリングを実施しているか否か
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.numbering.to_s }
  #   =>
  #   odpt.Operator:TokyoMetro         : true
  #   odpt.Operator:Toei               : true
  #   odpt.Operator:ToeiNipporiToneri  : true
  #   odpt.Operator:Toden              : false
  #   odpt.Operator:JR-East            : false
  #   odpt.Operator:JR-Central         : false
  #   odpt.Operator:Tokyu              : true
  #   odpt.Operator:YokohamaMinatomiraiRailway : true
  #   odpt.Operator:Odakyu             : true
  #   odpt.Operator:HakoneTozan        : true
  #   odpt.Operator:Seibu              : true
  #   odpt.Operator:Tobu               : true
  #   odpt.Operator:SaitamaRailway     : false
  #   odpt.Operator:ToyoRapidRailway   : true
  #   odpt.Operator:Keio               : true
  #   odpt.Operator:Keisei             : true
  #   odpt.Operator:MIR                : true
  #   odpt.Operator:Yurikamome         : true
  #   odpt.Operator:TWR                : false
  def with_station_number?
    @additional_infos.with_station_number?
  end

  alias :numbering :with_station_number?

  # @return [::String or nil] 路線記号の形
  # @note 「縁取りあり・塗りつぶしなしの円」は "stroked_circle"、「縁取りあり・塗りつぶしなしの角丸四角形」は "stroked_rounded_square" とする。
  # @note 「縁取りなし・塗りつぶしありの角丸四角形」は "filled_rounded_square" とする。
  # @note 駅番号が定義されているが駅番号の図形・路線記号そのものを使用していない（数字のみ）の場合は "none" とする。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.railway_line_code_shape }
  #   =>
  #   odpt.Operator:TokyoMetro         : stroked_circle
  #   odpt.Operator:Toei               : stroked_circle
  #   odpt.Operator:ToeiNipporiToneri  : none
  #   odpt.Operator:Toden              : (nil)
  #   odpt.Operator:JR-East            : (nil)
  #   odpt.Operator:JR-Central         : (nil)
  #   odpt.Operator:Tokyu              : filled_rounded_square
  #   odpt.Operator:YokohamaMinatomiraiRailway : filled_rounded_square
  #   odpt.Operator:Odakyu             : stroked_circle
  #   odpt.Operator:HakoneTozan        : stroked_circle
  #   odpt.Operator:Seibu              : filled_rounded_square
  #   odpt.Operator:Tobu               : stroked_rounded_square
  #   odpt.Operator:SaitamaRailway     : (nil)
  #   odpt.Operator:ToyoRapidRailway   : stroked_circle
  #   odpt.Operator:Keio               : stroked_circle
  #   odpt.Operator:Keisei             : stroked_circle
  #   odpt.Operator:MIR                : none
  #   odpt.Operator:Yurikamome         : stroked_circle
  #   odpt.Operator:TWR                : (nil)
  attr_reader :railway_line_code_shape

  # @return [::Stirng or nil] 駅番号の形
  # @note 「縁取りあり・塗りつぶしなしの円」は "stroked_circle"、「縁取りあり・塗りつぶしなしの角丸四角形」は "stroked_rounded_square" とする。
  # @note 西武鉄道については独特なデザインの角丸四角形であるため、"seibu_rounded_square" とする。
  # @note 駅番号が定義されているが図形を使用していない（数字のみ）の場合は "none" とする。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.station_code_shape }
  #   =>
  #   odpt.Operator:TokyoMetro         : stroked_circle
  #   odpt.Operator:Toei               : stroked_circle
  #   odpt.Operator:ToeiNipporiToneri  : none
  #   odpt.Operator:Toden              : (nil)
  #   odpt.Operator:JR-East            : (nil)
  #   odpt.Operator:JR-Central         : (nil)
  #   odpt.Operator:Tokyu              : stroked_rounded_square
  #   odpt.Operator:YokohamaMinatomiraiRailway : stroked_rounded_square
  #   odpt.Operator:Odakyu             : stroked_circle
  #   odpt.Operator:HakoneTozan        : stroked_circle
  #   odpt.Operator:Seibu              : seibu_rounded_square
  #   odpt.Operator:Tobu               : stroked_rounded_square
  #   odpt.Operator:SaitamaRailway     : (nil)
  #   odpt.Operator:ToyoRapidRailway   : stroked_circle
  #   odpt.Operator:Keio               : stroked_circle
  #   odpt.Operator:Keisei             : stroked_circle
  #   odpt.Operator:MIR                : none
  #   odpt.Operator:Yurikamome         : stroked_circle
  #   odpt.Operator:TWR                : (nil)
  attr_reader :station_code_shape

  # @!group 鉄道事業者の色に関するメソッド

  # @return [::TokyoMetro::Static::Color] 事業者の色

  def color
    @additional_infos.color
  end

  include ::OdptCommon::Modules::Color::Static::Fundamental::GetColorInfo
  include ::OdptCommon::Modules::Color::Static::Normal

  def code
    @additional_infos.code
  end

  # @!endgroup

# @!group インスタンスの基本的な情報を取得するメソッド

  # インスタンスの比較に用いるメソッド
  # @return [Integer]
  def <=>( others )
    @index <=> others.index
  end

  # インスタンスの情報を文字列にして返すメソッド
  # @return [String]
  def to_s( indent = 0 )
    self.instance_variables.map { |v|
      k = v.to_s.gsub( /\A\@/ , "" ).ljust(32)
      val = self.instance_variable_get(v)

      if val.instance_of?( ::Array )
        val = val.join("／")
      else
        val = val.to_s
      end

      " " * indent + k + val
    }.join( "\n" )
  end

  # @!endgroup

  private

  def name_ja_to_a
    name_ja
  end

  def name_en_to_a
    name_en
  end

  def operator_info_of?( *args )
    super( *args , compared: @same_as  )
  end

end
