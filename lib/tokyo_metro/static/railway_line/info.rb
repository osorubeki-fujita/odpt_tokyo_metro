# 個別の路線の情報を扱うクラス
class TokyoMetro::Static::RailwayLine::Info < TokyoMetro::Static::Fundamental::Info

  include ::OdptCommon::Modules::Polymorphic::RailwayLine
  include ::OdptCommon::Modules::Decision::Common::RailwayLine::Name

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine

  include ::OdptCommon::Modules::Name::Static::Fundamental::NameForInspection
  include ::OdptCommon::Modules::Name::Common::Fundamental::GetMainName

  include ::TokyoMetro::Modules::Decision::Common::Fundamental::CompareBase
  include ::TokyoMetro::Modules::Decision::Common::SameAs

  include ::OdptCommon::Modules::Decision::Common::Operator::Name
  include ::TokyoMetro::Modules::Decision::Common::Operator::Name

  include ::TokyoMetro::Modules::Decision::Common::RailwayLine::Name

  include ::OdptCommon::Modules::Name::Common::RailwayLine::Info
  include ::OdptCommon::Modules::Attributes::Common::RailwayLine::Station
  include ::OdptCommon::Modules::Attributes::Common::RailwayLine::Branch
  include ::TokyoMetro::Modules::Name::Common::RailwayLine::CssClass

  include ::TokyoMetro::Modules::Decision::Common::RailwayLine::BranchLine
  include ::OdptCommon::Modules::MethodMissing::Decision::Common::RailwayLine::BranchLine

  include ::TokyoMetro::Modules::Decision::Common::RailwayLine::NewAndOld

  include ::OdptCommon::Modules::MethodMissing::Decision::Common::Operator

  # Constructor
  # @param same_as [::String]
  # @param name_ja [::Array <::String>]
  # @param name_hira
  # @param name_en [::Array <::String>]
  # @param operator [::TokyoMetro::Static::Operator::Info]
  # @param index [::Numeric]
  # @param code_infos
  def initialize(
    same_as , name_ja , name_hira , name_en , operator , index_in_operator , code_infos ,
    start_on , end_on ,
    main_railway_line_infos , branch_railway_line_infos ,
    twitter_account_info
  )
    @same_as = same_as
    @name_ja = name_ja
    @name_hira = name_hira
    @name_en = name_en

    @index_in_operator = index_in_operator
    @operator = operator
    @code_infos = code_infos

    @start_on = start_on
    @end_on = end_on

    @main_railway_line_infos = main_railway_line_infos
    @branch_railway_line_infos = branch_railway_line_infos

    @twitter_account_info = twitter_account_info
  end

  attr_reader :start_on
  attr_reader :end_on

  attr_reader :main_railway_line_infos
  attr_reader :branch_railway_line_infos

  attr_reader :twitter_account_info

  # インスタンスの比較に用いるメソッド
  # @return [Integer]
  def <=>( other )
    if @operator.same_as?( other.operator.same_as )
      @index_in_operator <=> other.index_in_operator
    else
      @operator <=> other.operator
    end
  end

  # インスタンスの情報を文字列にして返すメソッド
  # @return [String]
  def to_s( indent = 0 )
    str_1 = self.instance_variables.map { |v|
      k = v.to_s.gsub( /\A\@/ , "" ).ljust(32)
      val = self.instance_variable_get(v)

      if v == :@operator
        val = "\n" + val.to_s( indent + 2 )
      elsif val.instance_of?( ::Array )
        val = val.join("／")
      else
        val = val.to_s
      end

      " " * indent + k + val
    }.join( "\n" )

    str_2 = [ :name_ja_with_operator_name_precise , :name_en_with_operator_name_precise , :css_class ].map { |v|
      k = v.to_s.ljust(32)
      val = self.__send__(v)
      " " * indent + k + val
    }.join( "\n" )

    [ "=" * 96 , str_1 , "-" * 96 , str_2 ].join( "\n" )
  end

# @!group 路線の ID に関するメソッド

  # @return [::String] 路線の ID キー
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza
  #   odpt.Railway:TokyoMetro.Marunouchi
  #   odpt.Railway:TokyoMetro.MarunouchiBranch
  #   odpt.Railway:TokyoMetro.Hibiya
  #   odpt.Railway:TokyoMetro.Tozai
  #   odpt.Railway:TokyoMetro.Chiyoda
  #   odpt.Railway:TokyoMetro.ChiyodaBranch
  #   odpt.Railway:TokyoMetro.Yurakucho
  #   odpt.Railway:TokyoMetro.Hanzomon
  #   odpt.Railway:TokyoMetro.Namboku
  #   odpt.Railway:TokyoMetro.Fukutoshin
  #   odpt.Railway:Toei.Asakusa
  #   odpt.Railway:Toei.Mita
  #   odpt.Railway:Toei.Shinjuku
  #   odpt.Railway:Toei.Oedo
  #   odpt.Railway:Toei.NipporiToneri
  #   odpt.Railway:Toei.TodenArakawa
  #   odpt.Railway:JR-East
  #   odpt.Railway:JR-East.Yamanote
  #   odpt.Railway:JR-East.KeihinTohoku
  #   odpt.Railway:JR-East.Tokaido
  #   odpt.Railway:JR-East.Yokosuka
  #   odpt.Railway:JR-East.Takasaki
  #   odpt.Railway:JR-East.Utsunomiya
  #   odpt.Railway:JR-East.ShonanShinjuku
  #   odpt.Railway:JR-East.UenoTokyo
  #   odpt.Railway:JR-East.Chuo
  #   odpt.Railway:JR-East.ChuoKaisoku
  #   odpt.Railway:JR-East.ChuoSobu
  #   odpt.Railway:JR-East.ChuoTozai
  #   odpt.Railway:JR-East.SobuTozai
  #   odpt.Railway:JR-East.Sobu
  #   odpt.Railway:JR-East.NaritaExpress
  #   odpt.Railway:JR-East.Saikyo
  #   odpt.Railway:JR-East.Joban
  #   odpt.Railway:JR-East.Keiyo
  #   odpt.Railway:JR-East.Musashino
  #   odpt.Railway:JR-East.Shinkansen
  #   odpt.Railway:JR-Central.Shinkansen
  #   odpt.Railway:Tokyu.Toyoko
  #   odpt.Railway:Tokyu.Meguro
  #   odpt.Railway:Tokyu.DenEnToshi
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai
  #   odpt.Railway:Odakyu.Odawara
  #   odpt.Railway:Odakyu.Tama
  #   odpt.Railway:Odakyu.Enoshima
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide
  #   odpt.Railway:HakoneTozan.Rail.GoraSide
  #   odpt.Railway:Seibu.Ikebukuro
  #   odpt.Railway:Seibu.SeibuChichibu
  #   odpt.Railway:Seibu.Toshima
  #   odpt.Railway:Seibu.Sayama
  #   odpt.Railway:Seibu.SeibuYurakucho
  #   odpt.Railway:Seibu.Shinjuku
  #   odpt.Railway:Tobu.SkytreeIsesaki
  #   odpt.Railway:Tobu.SkytreeOshiage
  #   odpt.Railway:Tobu.Skytree
  #   odpt.Railway:Tobu.Isesaki
  #   odpt.Railway:Tobu.Nikko
  #   odpt.Railway:Tobu.Kinugawa
  #   odpt.Railway:Tobu.Tojo
  #   odpt.Railway:SaitamaRailway.SaitamaRailway
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway
  #   odpt.Railway:Keio.Keio
  #   odpt.Railway:Keio.New
  #   odpt.Railway:Keio.Inokashira
  #   odpt.Railway:Keisei.KeiseiMain
  #   odpt.Railway:Keisei.KeiseiOshiage
  #   odpt.Railway:MIR.TX
  #   odpt.Railway:Yurikamome.Yurikamome
  #   odpt.Railway:TWR.Rinkai
  attr_reader :same_as

# @!group 路線の記号・番号に関するメソッド

  attr_reader :code_infos

  # @return [::Array <::String>] 路線記号
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.codes }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : ["G"]
  #   odpt.Railway:TokyoMetro.Marunouchi               : ["M"]
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : ["m"]
  #   odpt.Railway:TokyoMetro.Hibiya                   : ["H"]
  #   odpt.Railway:TokyoMetro.Tozai                    : ["T"]
  #   odpt.Railway:TokyoMetro.Chiyoda                  : ["C"]
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : ["C"]
  #   odpt.Railway:TokyoMetro.Yurakucho                : ["Y"]
  #   odpt.Railway:TokyoMetro.Hanzomon                 : ["Z"]
  #   odpt.Railway:TokyoMetro.Namboku                  : ["N"]
  #   odpt.Railway:TokyoMetro.Fukutoshin               : ["F"]
  #   odpt.Railway:Toei.Asakusa                        : ["A"]
  #   odpt.Railway:Toei.Mita                           : ["I"]
  #   odpt.Railway:Toei.Shinjuku                       : ["S"]
  #   odpt.Railway:Toei.Oedo                           : ["E"]
  #   odpt.Railway:Toei.NipporiToneri                  : []
  #   odpt.Railway:Toei.TodenArakawa                   : []
  #   odpt.Railway:JR-East                             : []
  #   odpt.Railway:JR-East.Yamanote                    : []
  #   odpt.Railway:JR-East.KeihinTohoku                : []
  #   odpt.Railway:JR-East.Tokaido                     : []
  #   odpt.Railway:JR-East.Yokosuka                    : []
  #   odpt.Railway:JR-East.Takasaki                    : []
  #   odpt.Railway:JR-East.Utsunomiya                  : []
  #   odpt.Railway:JR-East.ShonanShinjuku              : []
  #   odpt.Railway:JR-East.UenoTokyo                   : []
  #   odpt.Railway:JR-East.Chuo                        : []
  #   odpt.Railway:JR-East.ChuoKaisoku                 : []
  #   odpt.Railway:JR-East.ChuoSobu                    : []
  #   odpt.Railway:JR-East.ChuoTozai                   : []
  #   odpt.Railway:JR-East.SobuTozai                   : []
  #   odpt.Railway:JR-East.Sobu                        : []
  #   odpt.Railway:JR-East.NaritaExpress               : []
  #   odpt.Railway:JR-East.Saikyo                      : []
  #   odpt.Railway:JR-East.Joban                       : []
  #   odpt.Railway:JR-East.Keiyo                       : []
  #   odpt.Railway:JR-East.Musashino                   : []
  #   odpt.Railway:JR-East.Shinkansen                  : []
  #   odpt.Railway:JR-Central.Shinkansen               : []
  #   odpt.Railway:Tokyu.Toyoko                        : ["TY"]
  #   odpt.Railway:Tokyu.Meguro                        : ["MG"]
  #   odpt.Railway:Tokyu.DenEnToshi                    : ["DT"]
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : ["MM"]
  #   odpt.Railway:Odakyu.Odawara                      : ["OH"]
  #   odpt.Railway:Odakyu.Tama                         : ["OT"]
  #   odpt.Railway:Odakyu.Enoshima                     : ["OE"]
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : ["OH"]
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : ["OH"]
  #   odpt.Railway:Seibu.Ikebukuro                     : ["SI"]
  #   odpt.Railway:Seibu.SeibuChichibu                 : ["SI"]
  #   odpt.Railway:Seibu.Toshima                       : ["SI"]
  #   odpt.Railway:Seibu.Sayama                        : ["SY"]
  #   odpt.Railway:Seibu.SeibuYurakucho                : ["SI"]
  #   odpt.Railway:Seibu.Shinjuku                      : ["SS"]
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : ["TS", "TI"]
  #   odpt.Railway:Tobu.SkytreeOshiage                 : ["TS"]
  #   odpt.Railway:Tobu.Skytree                        : ["TS"]
  #   odpt.Railway:Tobu.Isesaki                        : ["TI"]
  #   odpt.Railway:Tobu.Nikko                          : ["TN"]
  #   odpt.Railway:Tobu.Kinugawa                       : ["TN"]
  #   odpt.Railway:Tobu.Tojo                           : ["TJ"]
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : []
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : ["TR"]
  #   odpt.Railway:Keio.Keio                           : ["KO"]
  #   odpt.Railway:Keio.New                            : ["KO"]
  #   odpt.Railway:Keio.Inokashira                     : ["IK"]
  #   odpt.Railway:Keisei.KeiseiMain                   : ["KS"]
  #   odpt.Railway:Keisei.KeiseiOshiage                : ["KS"]
  #   odpt.Railway:MIR.TX                              : []
  #   odpt.Railway:Yurikamome.Yurikamome               : ["U"]
  #   odpt.Railway:TWR.Rinkai                          : []

  def codes
    @code_infos.map( &:code )
  end

  # @return [Numeric] 同一事業者内での路線の番号（整列のために定義）
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.index_in_operator.to_s.rjust(2) }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    :  1
  #   odpt.Railway:TokyoMetro.Marunouchi               :  2
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : 2.1
  #   odpt.Railway:TokyoMetro.Hibiya                   :  3
  #   odpt.Railway:TokyoMetro.Tozai                    :  4
  #   odpt.Railway:TokyoMetro.Chiyoda                  :  5
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : 5.1
  #   odpt.Railway:TokyoMetro.Yurakucho                :  6
  #   odpt.Railway:TokyoMetro.Hanzomon                 :  7
  #   odpt.Railway:TokyoMetro.Namboku                  :  8
  #   odpt.Railway:TokyoMetro.Fukutoshin               :  9
  #   odpt.Railway:Toei.Asakusa                        :  1
  #   odpt.Railway:Toei.Mita                           :  2
  #   odpt.Railway:Toei.Shinjuku                       :  3
  #   odpt.Railway:Toei.Oedo                           :  4
  #   odpt.Railway:Toei.NipporiToneri                  :  5
  #   odpt.Railway:Toei.TodenArakawa                   :  6
  #   odpt.Railway:JR-East                             :  0
  #   odpt.Railway:JR-East.Yamanote                    :  1
  #   odpt.Railway:JR-East.KeihinTohoku                :  2
  #   odpt.Railway:JR-East.Tokaido                     :  3
  #   odpt.Railway:JR-East.Yokosuka                    :  4
  #   odpt.Railway:JR-East.Takasaki                    :  5
  #   odpt.Railway:JR-East.Utsunomiya                  :  6
  #   odpt.Railway:JR-East.ShonanShinjuku              :  7
  #   odpt.Railway:JR-East.UenoTokyo                   :  8
  #   odpt.Railway:JR-East.Chuo                        :  9
  #   odpt.Railway:JR-East.ChuoKaisoku                 : 10
  #   odpt.Railway:JR-East.ChuoSobu                    : 11
  #   odpt.Railway:JR-East.ChuoTozai                   : 11.1
  #   odpt.Railway:JR-East.SobuTozai                   : 11.2
  #   odpt.Railway:JR-East.Sobu                        : 12
  #   odpt.Railway:JR-East.NaritaExpress               : 13
  #   odpt.Railway:JR-East.Saikyo                      : 14
  #   odpt.Railway:JR-East.Joban                       : 15
  #   odpt.Railway:JR-East.Keiyo                       : 16
  #   odpt.Railway:JR-East.Musashino                   : 17
  #   odpt.Railway:JR-East.Shinkansen                  : 18
  #   odpt.Railway:JR-Central.Shinkansen               :  1
  #   odpt.Railway:Tokyu.Toyoko                        :  1
  #   odpt.Railway:Tokyu.Meguro                        :  2
  #   odpt.Railway:Tokyu.DenEnToshi                    :  3
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai :  1
  #   odpt.Railway:Odakyu.Odawara                      :  1
  #   odpt.Railway:Odakyu.Tama                         :  2
  #   odpt.Railway:Odakyu.Enoshima                     :  3
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        :  4
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : 4.1
  #   odpt.Railway:Seibu.Ikebukuro                     :  1
  #   odpt.Railway:Seibu.SeibuChichibu                 :  2
  #   odpt.Railway:Seibu.Toshima                       :  3
  #   odpt.Railway:Seibu.Sayama                        :  4
  #   odpt.Railway:Seibu.SeibuYurakucho                :  5
  #   odpt.Railway:Seibu.Shinjuku                      :  6
  #   odpt.Railway:Tobu.SkytreeIsesaki                 :  1
  #   odpt.Railway:Tobu.SkytreeOshiage                 : 1.09
  #   odpt.Railway:Tobu.Skytree                        : 1.1
  #   odpt.Railway:Tobu.Isesaki                        :  2
  #   odpt.Railway:Tobu.Nikko                          :  3
  #   odpt.Railway:Tobu.Kinugawa                       : 3.1
  #   odpt.Railway:Tobu.Tojo                           :  5
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       :  1
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   :  1
  #   odpt.Railway:Keio.Keio                           :  1
  #   odpt.Railway:Keio.New                            :  2
  #   odpt.Railway:Keio.Inokashira                     :  3
  #   odpt.Railway:Keisei.KeiseiMain                   :  1
  #   odpt.Railway:Keisei.KeiseiOshiage                :  2
  #   odpt.Railway:MIR.TX                              :  1
  #   odpt.Railway:Yurikamome.Yurikamome               :  1
  #   odpt.Railway:TWR.Rinkai                          :  1
  attr_reader :index_in_operator

# @!group 鉄道事業者に関するメソッド (1) - ID、番号

  # @return [::TokyoMetro::Static::Operator::Info] 鉄道事業者
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.operator.class.name }
  #   =>
  #   TokyoMetro::Static::Operator::Info
  #   TokyoMetro::Static::Operator::Info
  #   ......
  #   TokyoMetro::Static::Operator::Info
  attr_reader :operator

  alias :operator_info :operator

  # 鉄道事業者の ID キー
  # @return [String]
  def oprerator_same_as
    @operator.same_as
  end

  # 鉄道事業者の番号（整列のための定義）
  # @return [Numeric]
  def operator_index
    @operator.index
  end

  # @!group 鉄道事業者の名称に関するメソッド (1) - 正式名称

  # 鉄道事業者の事業者の名称（日本語、正式名称）
  # @return [::Array <::String>]
  def operator_name_ja
    @operator.name_ja
  end

  # 鉄道事業者の事業者の名称（ローマ字表記、正式名称）
  # @return [::Array <::String>]
  def operator_name_en
    @operator.name_en
  end

  # @!group 鉄道事業者の名称に関するメソッド (2) - 表示用

  # 鉄道事業者の事業者の名称（日本語、略称・表示用）
  # @return [::String or nil]
  def operator_name_ja_short
    @operator.name_ja_short
  end

  # 鉄道事業者の事業者の名称（ローマ字表記、略称・表示用）
  # @return [::String or nil]
  def operator_name_en_short
    @operator.name_en_short
  end

  # @!group 鉄道事業者の名称に関するメソッド (3) - 標準の名称（詳細版）

  # 鉄道事業者の標準の名称（日本語・詳細版）
  # @return [::String]
  def operator_name_ja_normal_precise
    @operator.name_ja_normal_precise
  end

  # 鉄道事業者の標準の名称（ローマ字表記・詳細版）
  # @return [::String]
  def operator_name_en_normal_precise
    @operator.name_en_normal_precise
  end

  # @!group 鉄道事業者の名称に関するメソッド (4) - 標準の名称（簡易版）

  # 標準の名称（日本語・簡易版）
  # @return [::String]
  def operator_name_ja_normal
    @operator.name_ja_normal
  end

  # 標準の名称（ローマ字表記・簡易版）
  # @return [::String]
  def operator_name_en_normal
    @operator.name_en_normal
  end

  # @!group 鉄道事業者の名称に関するメソッド (5) - 乗り換え等の情報で使用

  # 乗り換え等の情報で使用する名称（日本語）
  # @return [::String or nil]
  def operator_name_ja_for_transfer_info
    @operator.name_ja_for_transfer_info
  end

  # 乗り換え等の情報で使用する名称（ローマ字表記）
  # @return [::String or nil]
  def operator_name_en_for_transfer_info
    @operator.name_en_for_transfer_info
  end

  # @!group 鉄道事業者の名称に関するメソッド (6) - 超詳細

  # 日本語・超詳細版
  # @return [::String]
  def oprerator_name_ja_very_precise
    @operator.name_ja_very_precise
  end

  # ローマ字表記・超詳細版
  # @return [::String]
  def oprerator_name_en_very_precise
    @operator.name_en_very_precise
  end

  # @!endgroup

  attr_reader :name_hira

# @!group 路線名に関するメソッド (1) - 路線名のみ・正式名称

  # @return [::Array <::String>] 路線の名称（日本語・路線名のみ・正式名称） - 路線名（インスタンス変数 name）が定義されている場合
  # @return [nil] nil - 路線名（インスタンス変数 name）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_ja }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : ["銀座線"]
  #   odpt.Railway:TokyoMetro.Marunouchi               : ["丸ノ内線"]
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : ["丸ノ内線（中野坂上 - 方南町）"]
  #   odpt.Railway:TokyoMetro.Hibiya                   : ["日比谷線"]
  #   odpt.Railway:TokyoMetro.Tozai                    : ["東西線"]
  #   odpt.Railway:TokyoMetro.Chiyoda                  : ["千代田線"]
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : ["千代田線（綾瀬 - 北綾瀬）"]
  #   odpt.Railway:TokyoMetro.Yurakucho                : ["有楽町線"]
  #   odpt.Railway:TokyoMetro.Hanzomon                 : ["半蔵門線"]
  #   odpt.Railway:TokyoMetro.Namboku                  : ["南北線"]
  #   odpt.Railway:TokyoMetro.Fukutoshin               : ["副都心線"]
  #   odpt.Railway:Toei.Asakusa                        : ["浅草線"]
  #   odpt.Railway:Toei.Mita                           : ["三田線"]
  #   odpt.Railway:Toei.Shinjuku                       : ["新宿���"]
  #   odpt.Railway:Toei.Oedo                           : ["大江戸線"]
  #   odpt.Railway:Toei.NipporiToneri                  : ["日暮里・舎人ライナー"]
  #   odpt.Railway:Toei.TodenArakawa                   : ["荒川線"]
  #   odpt.Railway:JR-East                             : ["JR各線"]
  #   odpt.Railway:JR-East.Yamanote                    : ["山手線"]
  #   odpt.Railway:JR-East.KeihinTohoku                : ["京浜東北線"]
  #   odpt.Railway:JR-East.Tokaido                     : ["東海道線"]
  #   odpt.Railway:JR-East.Yokosuka                    : ["横須賀線"]
  #   odpt.Railway:JR-East.Takasaki                    : ["高崎線"]
  #   odpt.Railway:JR-East.Utsunomiya                  : ["宇都宮線"]
  #   odpt.Railway:JR-East.ShonanShinjuku              : ["湘南新宿ライン"]
  #   odpt.Railway:JR-East.UenoTokyo                   : ["上野東京ライン"]
  #   odpt.Railway:JR-East.Chuo                        : ["中央線 特急"]
  #   odpt.Railway:JR-East.ChuoKaisoku                 : ["中央線 快速"]
  #   odpt.Railway:JR-East.ChuoSobu                    : ["中央・総武線 各駅停車"]
  #   odpt.Railway:JR-East.ChuoTozai                   : ["中央・総武線 各駅停車（東西線直通 中野 - 三鷹）"]
  #   odpt.Railway:JR-East.SobuTozai                   : ["中央・総武線 各駅停車（東西線直通 西船橋 - 津田沼）"]
  #   odpt.Railway:JR-East.Sobu                        : ["総武快速線"]
  #   odpt.Railway:JR-East.NaritaExpress               : ["成田エクスプレス"]
  #   odpt.Railway:JR-East.Saikyo                      : ["埼京線"]
  #   odpt.Railway:JR-East.Joban                       : ["常磐線"]
  #   odpt.Railway:JR-East.Keiyo                       : ["京葉線"]
  #   odpt.Railway:JR-East.Musashino                   : ["武蔵野線"]
  #   odpt.Railway:JR-East.Shinkansen                  : ["東北・秋田・山形・上越・長野新幹線"]
  #   odpt.Railway:JR-Central.Shinkansen               : ["東海道・山陽新幹線"]
  #   odpt.Railway:Tokyu.Toyoko                        : ["東横線"]
  #   odpt.Railway:Tokyu.Meguro                        : ["目黒線"]
  #   odpt.Railway:Tokyu.DenEnToshi                    : ["田園都市線"]
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : ["みなとみらい線"]
  #   odpt.Railway:Odakyu.Odawara                      : ["小田原線"]
  #   odpt.Railway:Odakyu.Tama                         : ["多摩線"]
  #   odpt.Railway:Odakyu.Enoshima                     : ["江ノ島線"]
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : ["箱根登山鉄道線（小田原 - 箱根湯本）"]
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : ["箱根登山鉄道線（箱根湯本 - 強羅）"]
  #   odpt.Railway:Seibu.Ikebukuro                     : ["池袋線"]
  #   odpt.Railway:Seibu.SeibuChichibu                 : ["秩父線"]
  #   odpt.Railway:Seibu.Toshima                       : ["豊島線"]
  #   odpt.Railway:Seibu.Sayama                        : ["狭山線"]
  #   odpt.Railway:Seibu.SeibuYurakucho                : ["西武有楽町線"]
  #   odpt.Railway:Seibu.Shinjuku                      : ["新宿線"]
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : ["スカイツリーライン（伊勢崎線）", "伊勢崎線"]
  #   odpt.Railway:Tobu.SkytreeOshiage                 : ["スカイツリーライン（押上 - 曳舟）"]
  #   odpt.Railway:Tobu.Skytree                        : ["スカイツリーライン"]
  #   odpt.Railway:Tobu.Isesaki                        : ["伊勢崎線"]
  #   odpt.Railway:Tobu.Nikko                          : ["日光線"]
  #   odpt.Railway:Tobu.Kinugawa                       : ["鬼怒川線"]
  #   odpt.Railway:Tobu.Tojo                           : ["東上線"]
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : []
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : []
  #   odpt.Railway:Keio.Keio                           : ["京王線"]
  #   odpt.Railway:Keio.New                            : ["新線"]
  #   odpt.Railway:Keio.Inokashira                     : ["井の頭線"]
  #   odpt.Railway:Keisei.KeiseiMain                   : ["本線"]
  #   odpt.Railway:Keisei.KeiseiOshiage                : ["押上線"]
  #   odpt.Railway:MIR.TX                              : []
  #   odpt.Railway:Yurikamome.Yurikamome               : ["ゆりかもめ"]
  #   odpt.Railway:TWR.Rinkai                          : []
  attr_reader :name_ja

  # @return [::Array <::String>] 路線の名称（ローマ字表記・路線名のみ・正式名称） - 路線名（インスタンス変数 name_en）が定義されている場合
  # @return [nil] nil - 路線名（インスタンス変数 name）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_en }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : ["Ginza Line"]
  #   odpt.Railway:TokyoMetro.Marunouchi               : ["Marunouchi Line"]
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : ["Marunouchi Line (Nakano-sakaue - Honancho)"]
  #   odpt.Railway:TokyoMetro.Hibiya                   : ["Hibiya Line"]
  #   odpt.Railway:TokyoMetro.Tozai                    : ["Tozai Line"]
  #   odpt.Railway:TokyoMetro.Chiyoda                  : ["Chiyoda Line"]
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : ["Chiyoda Line (Ayase - Kita-ayase)"]
  #   odpt.Railway:TokyoMetro.Yurakucho                : ["Yurakucho Line"]
  #   odpt.Railway:TokyoMetro.Hanzomon                 : ["Hanzomon Line"]
  #   odpt.Railway:TokyoMetro.Namboku                  : ["Namboku Line"]
  #   odpt.Railway:TokyoMetro.Fukutoshin               : ["Fukutoshin Line"]
  #   odpt.Railway:Toei.Asakusa                        : ["Asakusa Line"]
  #   odpt.Railway:Toei.Mita                           : ["Mita Line"]
  #   odpt.Railway:Toei.Shinjuku                       : ["Shinjuku Line"]
  #   odpt.Railway:Toei.Oedo                           : ["Oedo Line"]
  #   odpt.Railway:Toei.NipporiToneri                  : ["Nippori Toneri Liner"]
  #   odpt.Railway:Toei.TodenArakawa                   : ["Arakawa Line"]
  #   odpt.Railway:JR-East                             : ["JR Lines"]
  #   odpt.Railway:JR-East.Yamanote                    : ["Yamanote Line"]
  #   odpt.Railway:JR-East.KeihinTohoku                : ["Keihin-Tohoku Line"]
  #   odpt.Railway:JR-East.Tokaido                     : ["Tokaido Line"]
  #   odpt.Railway:JR-East.Yokosuka                    : ["Yokosuka Line"]
  #   odpt.Railway:JR-East.Takasaki                    : ["Takasaki Line"]
  #   odpt.Railway:JR-East.Utsunomiya                  : ["Utsunomiya Line"]
  #   odpt.Railway:JR-East.ShonanShinjuku              : ["Shonan-Shinjuku Line"]
  #   odpt.Railway:JR-East.UenoTokyo                   : ["Ueno-Tokyo Line"]
  #   odpt.Railway:JR-East.Chuo                        : ["Chuo Line (Limited Express)"]
  #   odpt.Railway:JR-East.ChuoKaisoku                 : ["Chuo Line (Rapid service)"]
  #   odpt.Railway:JR-East.ChuoSobu                    : ["Chuo and Sobu Line (Local service)"]
  #   odpt.Railway:JR-East.ChuoTozai                   : ["Chuo and Sobu Line (Local service, between Nakano and Mitaka)"]
  #   odpt.Railway:JR-East.SobuTozai                   : ["Chuo and Sobu Line (Local service, between Nishi-funabashi and Tsudanuma)"]
  #   odpt.Railway:JR-East.Sobu                        : ["Sobu Line (Rapid service)"]
  #   odpt.Railway:JR-East.NaritaExpress               : ["Narita Express"]
  #   odpt.Railway:JR-East.Saikyo                      : ["Saikyo Line"]
  #   odpt.Railway:JR-East.Joban                       : ["Joban Line"]
  #   odpt.Railway:JR-East.Keiyo                       : ["Keiyo Line"]
  #   odpt.Railway:JR-East.Musashino                   : ["Musashino Line"]
  #   odpt.Railway:JR-East.Shinkansen                  : ["Tohoku, Akita, Yamagata, Joetsu and Nagano Shinkansen"]
  #   odpt.Railway:JR-Central.Shinkansen               : ["Tokaido and Sanyo Shinkansen"]
  #   odpt.Railway:Tokyu.Toyoko                        : ["Toyoko Line"]
  #   odpt.Railway:Tokyu.Meguro                        : ["Meguro Line"]
  #   odpt.Railway:Tokyu.DenEnToshi                    : ["Den-en-toshi Line"]
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : ["Minatomirai Line"]
  #   odpt.Railway:Odakyu.Odawara                      : ["Odawara Line"]
  #   odpt.Railway:Odakyu.Tama                         : ["Tama Line"]
  #   odpt.Railway:Odakyu.Enoshima                     : ["Enoshima Line"]
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : ["Hakone Tozan Line"]
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : ["Hakone Tozan Line"]
  #   odpt.Railway:Seibu.Ikebukuro                     : ["Ikebukuro Line"]
  #   odpt.Railway:Seibu.SeibuChichibu                 : ["Chichibu Line"]
  #   odpt.Railway:Seibu.Toshima                       : ["Toshima Line"]
  #   odpt.Railway:Seibu.Sayama                        : ["Sayama Line"]
  #   odpt.Railway:Seibu.SeibuYurakucho                : ["Seibu Yurakucho Line"]
  #   odpt.Railway:Seibu.Shinjuku                      : ["Shinjuku Line"]
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : ["Skytree and Isesaki Line"]
  #   odpt.Railway:Tobu.SkytreeOshiage                 : ["Skytree Line (Oshiage - Hikifune)"]
  #   odpt.Railway:Tobu.Skytree                        : ["Skytree Line"]
  #   odpt.Railway:Tobu.Isesaki                        : ["Isesaki Line"]
  #   odpt.Railway:Tobu.Nikko                          : ["Nikko Line"]
  #   odpt.Railway:Tobu.Kinugawa                       : ["Kinugawa Line"]
  #   odpt.Railway:Tobu.Tojo                           : ["Tojo Line"]
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : []
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : []
  #   odpt.Railway:Keio.Keio                           : ["Keio Line"]
  #   odpt.Railway:Keio.New                            : ["New Line"]
  #   odpt.Railway:Keio.Inokashira                     : ["Inokashira Line"]
  #   odpt.Railway:Keisei.KeiseiMain                   : ["Main Line"]
  #   odpt.Railway:Keisei.KeiseiOshiage                : ["Oshiage Line"]
  #   odpt.Railway:MIR.TX                              : []
  #   odpt.Railway:Yurikamome.Yurikamome               : ["Yurikamome"]
  #   odpt.Railway:TWR.Rinkai                          : []
  attr_reader :name_en

# @!group 路線色に関するメソッド (1)

  # 標準の路線色を取得するメソッド
  # @return [::TokyoMetro::Static::Color or ::Array <::TokyoMetro::Static::Color>] インスタンス変数 color が定義されている場合
  # @return [nil] インスタンス変数 color が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | line | puts line.same_as.ljust(48) + " : " + line.color.class.name }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : Array
  #   odpt.Railway:TokyoMetro.Marunouchi               : Array
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : Array
  #   odpt.Railway:TokyoMetro.Hibiya                   : Array
  #   odpt.Railway:TokyoMetro.Tozai                    : Array
  #   odpt.Railway:TokyoMetro.Chiyoda                  : Array
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : Array
  #   odpt.Railway:TokyoMetro.Yurakucho                : Array
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Array
  #   odpt.Railway:TokyoMetro.Namboku                  : Array
  #   odpt.Railway:TokyoMetro.Fukutoshin               : Array
  #   odpt.Railway:Toei.Asakusa                        : Array
  #   odpt.Railway:Toei.Mita                           : Array
  #   odpt.Railway:Toei.Shinjuku                       : Array
  #   odpt.Railway:Toei.Oedo                           : Array
  #   odpt.Railway:Toei.NipporiToneri                  : Array
  #   odpt.Railway:Toei.TodenArakawa                   : Array
  #   odpt.Railway:JR-East                             : Array
  #   odpt.Railway:JR-East.Yamanote                    : Array
  #   odpt.Railway:JR-East.KeihinTohoku                : Array
  #   odpt.Railway:JR-East.Tokaido                     : Array
  #   odpt.Railway:JR-East.Yokosuka                    : Array
  #   odpt.Railway:JR-East.Takasaki                    : Array
  #   odpt.Railway:JR-East.Utsunomiya                  : Array
  #   odpt.Railway:JR-East.ShonanShinjuku              : Array
  #   odpt.Railway:JR-East.UenoTokyo                   : Array
  #   odpt.Railway:JR-East.Chuo                        : Array
  #   odpt.Railway:JR-East.ChuoKaisoku                 : Array
  #   odpt.Railway:JR-East.ChuoSobu                    : Array
  #   odpt.Railway:JR-East.ChuoTozai                   : Array
  #   odpt.Railway:JR-East.SobuTozai                   : Array
  #   odpt.Railway:JR-East.Sobu                        : Array
  #   odpt.Railway:JR-East.NaritaExpress               : Array
  #   odpt.Railway:JR-East.Saikyo                      : Array
  #   odpt.Railway:JR-East.Joban                       : Array
  #   odpt.Railway:JR-East.Keiyo                       : Array
  #   odpt.Railway:JR-East.Musashino                   : Array
  #   odpt.Railway:JR-East.Shinkansen                  : Array
  #   odpt.Railway:JR-Central.Shinkansen               : Array
  #   odpt.Railway:Tokyu.Toyoko                        : Array
  #   odpt.Railway:Tokyu.Meguro                        : Array
  #   odpt.Railway:Tokyu.DenEnToshi                    : Array
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : Array
  #   odpt.Railway:Odakyu.Odawara                      : NilClass
  #   odpt.Railway:Odakyu.Tama                         : NilClass
  #   odpt.Railway:Odakyu.Enoshima                     : NilClass
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : NilClass
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : NilClass
  #   odpt.Railway:Seibu.Ikebukuro                     : Array
  #   odpt.Railway:Seibu.SeibuChichibu                 : Array
  #   odpt.Railway:Seibu.Toshima                       : Array
  #   odpt.Railway:Seibu.Sayama                        : Array
  #   odpt.Railway:Seibu.SeibuYurakucho                : Array
  #   odpt.Railway:Seibu.Shinjuku                      : Array
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : Array
  #   odpt.Railway:Tobu.SkytreeOshiage                 : Array
  #   odpt.Railway:Tobu.Skytree                        : Array
  #   odpt.Railway:Tobu.Isesaki                        : Array
  #   odpt.Railway:Tobu.Nikko                          : Array
  #   odpt.Railway:Tobu.Kinugawa                       : Array
  #   odpt.Railway:Tobu.Tojo                           : Array
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : NilClass
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : NilClass
  #   odpt.Railway:Keio.Keio                           : Array
  #   odpt.Railway:Keio.New                            : Array
  #   odpt.Railway:Keio.Inokashira                     : Array
  #   odpt.Railway:Keisei.KeiseiMain                   : NilClass
  #   odpt.Railway:Keisei.KeiseiOshiage                : NilClass
  #   odpt.Railway:MIR.TX                              : NilClass
  #   odpt.Railway:Yurikamome.Yurikamome               : Array
  #   odpt.Railway:TWR.Rinkai                          : NilClass
  def colors
    @code_infos.map( &:color )
  end

  # 標準の路線色を取得するメソッド
  # @return [::TokyoMetro::Static::Color]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.color_normal.class.name }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : TokyoMetro::Static::Color
  #   odpt.Railway:TokyoMetro.Marunouchi               : TokyoMetro::Static::Color
  #   ......
  #   odpt.Railway:TWR.Rinkai                          : TokyoMetro::Static::Color
  def color_normal
    # 路線の色が定義されていない場合
    if colors_to_a.blank?
      # 事業者の色が定義されている場合は、事業者の色をそのまま標準の路線色とする。
      if operator_color.instance_of?( ::TokyoMetro::Static::Color )
        operator_color

      # 事業者の色が定義されていない場合は、#999999 を標準の路線色とする。
      else
        ::TokyoMetro::Static::Color.new( "\#999999" , 153 , 153 , 153 )
      end

    # @color が配列の場合は、配列の最初の要素を標準の路線色とする。
    elsif colors_to_a.instance_of?( ::Array )
      colors_to_a.first
    # 路線の色が1つのみ設定されている場合は、それを標準の路線色とする。
    else
      raise
    end
  end

  # 標準の路線色の HexColor を取得するメソッド
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.color_normal_hex }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : #f39700
  #   odpt.Railway:TokyoMetro.Marunouchi               : #e60012
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : #e60012
  #   odpt.Railway:TokyoMetro.Hibiya                   : #9caeb7
  #   odpt.Railway:TokyoMetro.Tozai                    : #00a7db
  #   odpt.Railway:TokyoMetro.Chiyoda                  : #009945
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : #009945
  #   odpt.Railway:TokyoMetro.Yurakucho                : #d7c447
  #   odpt.Railway:TokyoMetro.Hanzomon                 : #9b7cb6
  #   odpt.Railway:TokyoMetro.Namboku                  : #00ada9
  #   odpt.Railway:TokyoMetro.Fukutoshin               : #bb641d
  #   odpt.Railway:Toei.Asakusa                        : #e85298
  #   odpt.Railway:Toei.Mita                           : #0078c2
  #   odpt.Railway:Toei.Shinjuku                       : #6cbb5a
  #   odpt.Railway:Toei.Oedo                           : #b6007a
  #   odpt.Railway:Toei.NipporiToneri                  : #ff69b4
  #   odpt.Railway:Toei.TodenArakawa                   : #66cc66
  #   odpt.Railway:JR-East                             : #999999
  #   odpt.Railway:JR-East.Yamanote                    : #80c241
  #   odpt.Railway:JR-East.KeihinTohoku                : #00b2e5
  #   odpt.Railway:JR-East.Tokaido                     : #f68b1e
  #   odpt.Railway:JR-East.Yokosuka                    : #007ac0
  #   odpt.Railway:JR-East.Takasaki                    : #f68b1e
  #   odpt.Railway:JR-East.Utsunomiya                  : #f68b1e
  #   odpt.Railway:JR-East.ShonanShinjuku              : #e21f26
  #   odpt.Railway:JR-East.UenoTokyo                   : #654e99
  #   odpt.Railway:JR-East.Chuo                        : #007ac0
  #   odpt.Railway:JR-East.ChuoKaisoku                 : #f15a22
  #   odpt.Railway:JR-East.ChuoSobu                    : #ffd400
  #   odpt.Railway:JR-East.ChuoTozai                   : #00a7db
  #   odpt.Railway:JR-East.SobuTozai                   : #00a7db
  #   odpt.Railway:JR-East.Sobu                        : #007ac0
  #   odpt.Railway:JR-East.NaritaExpress               : #ff0000
  #   odpt.Railway:JR-East.Saikyo                      : #00b48d
  #   odpt.Railway:JR-East.Joban                       : #00b261
  #   odpt.Railway:JR-East.Keiyo                       : #c9242f
  #   odpt.Railway:JR-East.Musashino                   : #f15a22
  #   odpt.Railway:JR-East.Shinkansen                  : #008000
  #   odpt.Railway:JR-Central.Shinkansen               : #00008b
  #   odpt.Railway:Tokyu.Toyoko                        : #da0442
  #   odpt.Railway:Tokyu.Meguro                        : #009cd2
  #   odpt.Railway:Tokyu.DenEnToshi                    : #20a288
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : #09357f
  #   odpt.Railway:Odakyu.Odawara                      : #2288cc
  #   odpt.Railway:Odakyu.Tama                         : #2288cc
  #   odpt.Railway:Odakyu.Enoshima                     : #2288cc
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : #2288cc
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : #2288cc
  #   odpt.Railway:Seibu.Ikebukuro                     : #ff6600
  #   odpt.Railway:Seibu.SeibuChichibu                 : #ff6600
  #   odpt.Railway:Seibu.Toshima                       : #ff6600
  #   odpt.Railway:Seibu.Sayama                        : #ff6600
  #   odpt.Railway:Seibu.SeibuYurakucho                : #ff6600
  #   odpt.Railway:Seibu.Shinjuku                      : #0099cc
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : #0f6cc3
  #   odpt.Railway:Tobu.SkytreeOshiage                 : #0f6cc3
  #   odpt.Railway:Tobu.Skytree                        : #0f6cc3
  #   odpt.Railway:Tobu.Isesaki                        : #ff0000
  #   odpt.Railway:Tobu.Nikko                          : #ffa500
  #   odpt.Railway:Tobu.Kinugawa                       : #ffa500
  #   odpt.Railway:Tobu.Tojo                           : #000099
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : #6699ff
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : #3fb036
  #   odpt.Railway:Keio.Keio                           : #dd0077
  #   odpt.Railway:Keio.New                            : #dd0077
  #   odpt.Railway:Keio.Inokashira                     : #000088
  #   odpt.Railway:Keisei.KeiseiMain                   : #005aaa
  #   odpt.Railway:Keisei.KeiseiOshiage                : #005aaa
  #   odpt.Railway:MIR.TX                              : #000084
  #   odpt.Railway:Yurikamome.Yurikamome               : #00418e
  #   odpt.Railway:TWR.Rinkai                          : #00418e
  def color_normal_hex
    color_normal.hex_color
  end

  # 標準の路線色の Red, Green, Blue の各成分の情報を括弧で囲んだ文字列にして返すメソッド
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.to_color_normal_rgb_in_parentheses }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : ( 243 , 151 , 0 )
  #   odpt.Railway:TokyoMetro.Marunouchi               : ( 230 , 0 , 18 )
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : ( 230 , 0 , 18 )
  #   odpt.Railway:TokyoMetro.Hibiya                   : ( 156 , 174 , 183 )
  #   odpt.Railway:TokyoMetro.Tozai                    : ( 0 , 167 , 219 )
  #   odpt.Railway:TokyoMetro.Chiyoda                  : ( 0 , 153 , 69 )
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : ( 0 , 153 , 69 )
  #   odpt.Railway:TokyoMetro.Yurakucho                : ( 215 , 196 , 71 )
  #   odpt.Railway:TokyoMetro.Hanzomon                 : ( 155 , 124 , 182 )
  #   odpt.Railway:TokyoMetro.Namboku                  : ( 0 , 173 , 169 )
  #   odpt.Railway:TokyoMetro.Fukutoshin               : ( 187 , 100 , 29 )
  #   odpt.Railway:Toei.Asakusa                        : ( 232 , 82 , 152 )
  #   odpt.Railway:Toei.Mita                           : ( 0 , 120 , 194 )
  #   odpt.Railway:Toei.Shinjuku                       : ( 108 , 187 , 90 )
  #   odpt.Railway:Toei.Oedo                           : ( 182 , 0 , 122 )
  #   odpt.Railway:Toei.NipporiToneri                  : ( 255 , 105 , 180 )
  #   odpt.Railway:Toei.TodenArakawa                   : ( 102 , 204 , 102 )
  #   odpt.Railway:JR-East                             : ( 153 , 153 , 153 )
  #   odpt.Railway:JR-East.Yamanote                    : ( 128 , 194 , 65 )
  #   odpt.Railway:JR-East.KeihinTohoku                : ( 0 , 178 , 229 )
  #   odpt.Railway:JR-East.Tokaido                     : ( 246 , 139 , 30 )
  #   odpt.Railway:JR-East.Yokosuka                    : ( 0 , 122 , 192 )
  #   odpt.Railway:JR-East.Takasaki                    : ( 246 , 139 , 30 )
  #   odpt.Railway:JR-East.Utsunomiya                  : ( 246 , 139 , 30 )
  #   odpt.Railway:JR-East.ShonanShinjuku              : ( 226 , 31 , 38 )
  #   odpt.Railway:JR-East.UenoTokyo                   : ( 101 , 78 , 153 )
  #   odpt.Railway:JR-East.Chuo                        : ( 0 , 122 , 192 )
  #   odpt.Railway:JR-East.ChuoKaisoku                 : ( 241 , 90 , 34 )
  #   odpt.Railway:JR-East.ChuoSobu                    : ( 255 , 212 , 0 )
  #   odpt.Railway:JR-East.ChuoTozai                   : ( 0 , 167 , 219 )
  #   odpt.Railway:JR-East.SobuTozai                   : ( 0 , 167 , 219 )
  #   odpt.Railway:JR-East.Sobu                        : ( 0 , 122 , 192 )
  #   odpt.Railway:JR-East.NaritaExpress               : ( 255 , 0 , 0 )
  #   odpt.Railway:JR-East.Saikyo                      : ( 0 , 180 , 141 )
  #   odpt.Railway:JR-East.Joban                       : ( 0 , 178 , 97 )
  #   odpt.Railway:JR-East.Keiyo                       : ( 201 , 36 , 47 )
  #   odpt.Railway:JR-East.Musashino                   : ( 241 , 90 , 34 )
  #   odpt.Railway:JR-East.Shinkansen                  : ( 0 , 128 , 0 )
  #   odpt.Railway:JR-Central.Shinkansen               : ( 0 , 0 , 139 )
  #   odpt.Railway:Tokyu.Toyoko                        : ( 218 , 4 , 66 )
  #   odpt.Railway:Tokyu.Meguro                        : ( 0 , 156 , 210 )
  #   odpt.Railway:Tokyu.DenEnToshi                    : ( 32 , 162 , 136 )
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : ( 9 , 53 , 127 )
  #   odpt.Railway:Odakyu.Odawara                      : ( 34 , 136 , 204 )
  #   odpt.Railway:Odakyu.Tama                         : ( 34 , 136 , 204 )
  #   odpt.Railway:Odakyu.Enoshima                     : ( 34 , 136 , 204 )
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : ( 34 , 136 , 204 )
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : ( 34 , 136 , 204 )
  #   odpt.Railway:Seibu.Ikebukuro                     : ( 255 , 102 , 0 )
  #   odpt.Railway:Seibu.SeibuChichibu                 : ( 255 , 102 , 0 )
  #   odpt.Railway:Seibu.Toshima                       : ( 255 , 102 , 0 )
  #   odpt.Railway:Seibu.Sayama                        : ( 255 , 102 , 0 )
  #   odpt.Railway:Seibu.SeibuYurakucho                : ( 255 , 102 , 0 )
  #   odpt.Railway:Seibu.Shinjuku                      : ( 0 , 153 , 204 )
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : ( 15 , 108 , 195 )
  #   odpt.Railway:Tobu.SkytreeOshiage                 : ( 15 , 108 , 195 )
  #   odpt.Railway:Tobu.Skytree                        : ( 15 , 108 , 195 )
  #   odpt.Railway:Tobu.Isesaki                        : ( 255 , 0 , 0 )
  #   odpt.Railway:Tobu.Nikko                          : ( 255 , 165 , 0 )
  #   odpt.Railway:Tobu.Kinugawa                       : ( 255 , 165 , 0 )
  #   odpt.Railway:Tobu.Tojo                           : ( 0 , 0 , 153 )
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : ( 102 , 153 , 255 )
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : ( 63 , 176 , 54 )
  #   odpt.Railway:Keio.Keio                           : ( 221 , 0 , 119 )
  #   odpt.Railway:Keio.New                            : ( 221 , 0 , 119 )
  #   odpt.Railway:Keio.Inokashira                     : ( 0 , 0 , 136 )
  #   odpt.Railway:Keisei.KeiseiMain                   : ( 0 , 90 , 170 )
  #   odpt.Railway:Keisei.KeiseiOshiage                : ( 0 , 90 , 170 )
  #   odpt.Railway:MIR.TX                              : ( 0 , 0 , 132 )
  #   odpt.Railway:Yurikamome.Yurikamome               : ( 0 , 65 , 142 )
  #   odpt.Railway:TWR.Rinkai                          : ( 0 , 65 , 142 )
  def to_color_normal_rgb_in_parentheses
    color_normal.to_rgb_color_in_parentheses
  end

  # @!group 路線色に関するメソッド (2)

  # 標準の路線色の R 成分を取得するメソッド
  # @return [Integer]
  def color_normal_red
    color_normal.red
  end

  # 標準の路線色の G 成分を取得するメソッド
  # @return [Integer]
  def color_normal_green
    color_normal.green
  end

  # 標準の路線色の B 成分を取得するメソッド
  # @return [Integer]
  def color_normal_blue
    color_normal.blue
  end

# @!group 鉄道事業者の駅番号・路線番号に関するメソッド

  # 駅ナンバリングを実施しているか否か
  # @return [Boolean]
  def operator_numbering
    @operator.numbering
  end

  # 路線番号の形
  # @return [Stirng or nil]
  def operator_railway_line_code_shape
    @operator.railway_line_code_shape
  end

  # 駅記号の形
  # @return [Stirng or nil]
  def operator_station_code_shape
    @operator.station_code_shape
  end

  # @!group 鉄道事業者の色に関するメソッド (1)

  # 鉄道事業者の色を取得するメソッド
  # @return [::TokyoMetro::Static::Color]
  def operator_color
    @operator.color
  end

  # 鉄道事業者の色の HexColor を取得するメソッド
  # @return [String]
  def operator_hex_color
    @operator.hex_color
  end

  # 鉄道事業者の色の Red, Green, Blue の各成分の情報を括弧で囲んだ文字列にして返すメソッド
  # @return [String]
  def to_operator_rgb_color_in_parentheses
    @operator.to_rgb_color_in_parentheses
  end

  # @!group 鉄道事業者の色に関するメソッド (2)

  # 鉄道事業者の色の R 成分を取得するメソッド
  # @return [Integer]
  def operator_color_red
    @operator.red
  end

  # 鉄道事業者の色の G 成分を取得するメソッド
  # @return [Integer]
  def operator_color_green
    @operator.green
  end

  # 鉄道事業者の色の B 成分を取得するメソッド
  # @return [Integer]
  def operator_color_blue
    @operator.blue
  end

  # @!group SCSS に関するメソッド

  # SCSS で include する、形状を表す mixin を返すメソッド
  # @return [::String]
  def included_scss_mixin_for_railway_line_code_shape
    case operator_railway_line_code_shape
    when nil
      "rounded_square"
    when "none"
      "rounded_square"
    when "filled_rounded_square" , "stroked_circle" , "stroked_rounded_square"
      "railway_line_code_#{ operator_railway_line_code_shape }"
    end
  end

  # 塗りつぶしなしの図形の縁取り線の太さを返すメソッド
  # @return [Numeric] 縁取り線を設定する場合
  # @return [nil] 縁取り線を設定しない場合
  def stroke_line_width_of_stroked_line_for_scss( rate: 1 )
    case operator_railway_line_code_shape
    when "stroked_circle" , "stroked_rounded_square"
      if subways_in_tokyo?
        num = 9
      else
        num = 6
      end
      num * rate
    else
      nil
    end
  end

  # テキストの設定（include する mixin）を返すメソッド
  # @return [::Array]
  def railway_line_code_text_settings_for_scss
    ary = ::Array.new
    # 路線記号が定義されている場合
    if code_normal.string?
      if code_normal.length == 1
        ary << "railway_line_code_large_letter"
      else
        ary << "railway_line_code_small_letter"
      end

      if with_bold_railway_line_code_text?
        ary << "railway_line_code_bold"
      end
    end
    ary
  end

  # @!group 支線

  def is_branch_railway_line_info?
    @main_railway_line_infos.present?
  end

  def has_branch_railway_line_infos?
    @branch_railway_line_infos.present?
  end

  # @!group To Factory

  def seed_railway_line_relations
    self.class.factory_for_seeding_railway_line_relations.process( self )
  end

  # @!endgroup

  private

  # @!group 基礎情報の配列

  def name_ja_to_a
    name_ja
  end

  def name_en_to_a
    name_en
  end

  def codes_to_a
    codes.try( :delete_if , &:blank? )
  end

  def colors_to_a
    colors.try( :delete_if , &:blank? )
  end

  # @!endgroup

  def operator_info_of?( *args )
    super( *args , compared: operator_info.same_as )
  end

end
