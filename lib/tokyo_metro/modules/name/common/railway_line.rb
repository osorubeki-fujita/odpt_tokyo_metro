# @note Rails の model {::RailwayLine} には column 'is_branch_railway_line_info' が定義されているので、この module を include することができる。
module TokyoMetro::Modules::Name::Common::RailwayLine

# @!group 判定 - 名称（日本語）

def has_name_ja?
  name_ja_to_a.present?
end

def has_one_name_ja?
  name_ja_to_a.length == 1
end

def has_many_name_ja?
  name_ja_to_a.length > 1
end

# @!group 判定 - 名称（ローマ字）

def has_name_en?
  name_en_to_a.present?
end

def has_one_name_en?
  name_en_to_a.length == 1
end

def has_many_name_en?
  name_en_to_a.length > 1
end

# @!group 判定 - 路線記号

def has_name_codes?
  name_codes.present?
end

def has_one_name_code?
  name_codes.length == 1
end

def has_many_name_codes?
  name_codes.length > 1
end

# @!group 路線名に関するメソッド (2) - 標準（路線名のみ）

  # 路線名（標準・日本語表記・路線名のみ）を取得するメソッド
  # @return [String] 路線名（インスタンス変数 name）が定義されている場合
  # @return [nil] 路線名（インスタンス変数 name）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_ja_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : 銀座線
  #   odpt.Railway:TokyoMetro.Marunouchi               : 丸ノ内線
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : 丸ノ内線（中野坂上 - 方南町）
  #   odpt.Railway:TokyoMetro.Hibiya                   : 日比谷線
  #   odpt.Railway:TokyoMetro.Tozai                    : 東西線
  #   odpt.Railway:TokyoMetro.Chiyoda                  : 千代田線
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : 千代田線（綾瀬 - 北綾瀬）
  #   odpt.Railway:TokyoMetro.Yurakucho                : 有楽町線
  #   odpt.Railway:TokyoMetro.Hanzomon                 : 半蔵門線
  #   odpt.Railway:TokyoMetro.Namboku                  : 南北線
  #   odpt.Railway:TokyoMetro.Fukutoshin               : 副都心線
  #   odpt.Railway:Toei.Asakusa                        : 浅草線
  #   odpt.Railway:Toei.Mita                           : 三田線
  #   odpt.Railway:Toei.Shinjuku                       : 新宿線
  #   odpt.Railway:Toei.Oedo                           : 大江戸線
  #   odpt.Railway:Toei.NipporiToneri                  : 日暮里・舎人ライナー
  #   odpt.Railway:Toei.TodenArakawa                   : 荒川線
  #   odpt.Railway:JR-East                             : JR各線
  #   odpt.Railway:JR-East.Yamanote                    : 山手線
  #   odpt.Railway:JR-East.KeihinTohoku                : 京浜東北線
  #   odpt.Railway:JR-East.Tokaido                     : 東海道線
  #   odpt.Railway:JR-East.Yokosuka                    : 横須賀線
  #   odpt.Railway:JR-East.Takasaki                    : 高崎線
  #   odpt.Railway:JR-East.Utsunomiya                  : 宇都宮線
  #   odpt.Railway:JR-East.ShonanShinjuku              : 湘南新宿ライン
  #   odpt.Railway:JR-East.UenoTokyo                   : 上野東京ライン
  #   odpt.Railway:JR-East.Chuo                        : 中央線 特急
  #   odpt.Railway:JR-East.ChuoKaisoku                 : 中央線 快速
  #   odpt.Railway:JR-East.ChuoSobu                    : 中央・総武線 各駅停車
  #   odpt.Railway:JR-East.ChuoTozai                   : 中央・総武線 各駅停車（東西線直通 中野 - 三鷹）
  #   odpt.Railway:JR-East.SobuTozai                   : 中央・総武線 各駅停車（東西線直通 西船橋 - 津田沼）
  #   odpt.Railway:JR-East.Sobu                        : 総武快速線
  #   odpt.Railway:JR-East.NaritaExpress               : 成田エクスプレス
  #   odpt.Railway:JR-East.Saikyo                      : 埼京線
  #   odpt.Railway:JR-East.Joban                       : 常磐線
  #   odpt.Railway:JR-East.Keiyo                       : 京葉線
  #   odpt.Railway:JR-East.Musashino                   : 武蔵野線
  #   odpt.Railway:JR-East.Shinkansen                  : 東北・秋田・山形・上越・長野新幹線
  #   odpt.Railway:JR-Central.Shinkansen               : 東海道・山陽新幹線
  #   odpt.Railway:Tokyu.Toyoko                        : 東横線
  #   odpt.Railway:Tokyu.Meguro                        : 目黒線
  #   odpt.Railway:Tokyu.DenEnToshi                    : 田園都市線
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : みなとみらい線
  #   odpt.Railway:Odakyu.Odawara                      : 小田原線
  #   odpt.Railway:Odakyu.Tama                         : 多摩線
  #   odpt.Railway:Odakyu.Enoshima                     : 江ノ島線
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : 箱根登山鉄道線（小田原 - 箱根湯本）
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : 箱根登山鉄道線（箱根湯本 - 強羅）
  #   odpt.Railway:Seibu.Ikebukuro                     : 池袋線
  #   odpt.Railway:Seibu.SeibuChichibu                 : 秩父線
  #   odpt.Railway:Seibu.Toshima                       : 豊島線
  #   odpt.Railway:Seibu.Sayama                        : 狭山線
  #   odpt.Railway:Seibu.SeibuYurakucho                : 西武有楽町線
  #   odpt.Railway:Seibu.Shinjuku                      : 新宿線
  #   odpt.Railway:Tobu.SkyTreeIsesaki                 : スカイツリーライン（伊勢崎線）
  #   odpt.Railway:Tobu.SkyTreeOshiage                 : スカイツリーライン（押上 - 曳舟）
  #   odpt.Railway:Tobu.SkyTree                        : スカイツリーライン
  #   odpt.Railway:Tobu.Isesaki                        : 伊勢崎線
  #   odpt.Railway:Tobu.Nikko                          : 日光線
  #   odpt.Railway:Tobu.Kinugawa                       : 鬼怒川線
  #   odpt.Railway:Tobu.Tojo                           : 東上線
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : (nil)
  #   odpt.Railway:Keio.Keio                           : 京王線
  #   odpt.Railway:Keio.New                            : 新線
  #   odpt.Railway:Keio.Inokashira                     : 井の頭線
  #   odpt.Railway:Keisei.KeiseiMain                   : 本線
  #   odpt.Railway:Keisei.KeiseiOshiage                : 押上線
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : ゆりかもめ
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def name_ja_normal
    get_name( name_ja_to_a , allow_nil: true )
  end

  # 路線名（標準・ローマ字表記・路線名のみ）を取得するメソッド
  # @return [String] 路線名（インスタンス変数 name_en）が定義されている場合
  # @return [nil] 路線名（インスタンス変数 name_en）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_en_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : Ginza Line
  #   odpt.Railway:TokyoMetro.Marunouchi               : Marunouchi Line
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : Marunouchi Line (Nakano-sakaue - Honancho)
  #   odpt.Railway:TokyoMetro.Hibiya                   : Hibiya Line
  #   odpt.Railway:TokyoMetro.Tozai                    : Tozai Line
  #   odpt.Railway:TokyoMetro.Chiyoda                  : Chiyoda Line
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : Chiyoda Line (Ayase - Kita-ayase)
  #   odpt.Railway:TokyoMetro.Yurakucho                : Yurakucho Line
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Hanzomon Line
  #   odpt.Railway:TokyoMetro.Namboku                  : Namboku Line
  #   odpt.Railway:TokyoMetro.Fukutoshin               : Fukutoshin Line
  #   odpt.Railway:Toei.Asakusa                        : Asakusa Line
  #   odpt.Railway:Toei.Mita                           : Mita Line
  #   odpt.Railway:Toei.Shinjuku                       : Shinjuku Line
  #   odpt.Railway:Toei.Oedo                           : Oedo Line
  #   odpt.Railway:Toei.NipporiToneri                  : Nippori Toneri Liner
  #   odpt.Railway:Toei.TodenArakawa                   : Arakawa Line
  #   odpt.Railway:JR-East                             : JR Lines
  #   odpt.Railway:JR-East.Yamanote                    : Yamanote Line
  #   odpt.Railway:JR-East.KeihinTohoku                : Keihin-Tohoku Line
  #   odpt.Railway:JR-East.Tokaido                     : Tokaido Line
  #   odpt.Railway:JR-East.Yokosuka                    : Yokosuka Line
  #   odpt.Railway:JR-East.Takasaki                    : Takasaki Line
  #   odpt.Railway:JR-East.Utsunomiya                  : Utsunomiya Line
  #   odpt.Railway:JR-East.ShonanShinjuku              : Shonan-Shinjuku Line
  #   odpt.Railway:JR-East.UenoTokyo                   : Ueno-Tokyo Line
  #   odpt.Railway:JR-East.Chuo                        : Chuo Line (Limited Express)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : Chuo Line (Rapid service)
  #   odpt.Railway:JR-East.ChuoSobu                    : Chuo and Sobu Line (Local service)
  #   odpt.Railway:JR-East.ChuoTozai                   : Chuo and Sobu Line (Local service, between Nakano and Mitaka)
  #   odpt.Railway:JR-East.SobuTozai                   : Chuo and Sobu Line (Local service, between Nishi-funabashi and Tsudanuma)
  #   odpt.Railway:JR-East.Sobu                        : Sobu Line (Rapid service)
  #   odpt.Railway:JR-East.NaritaExpress               : Narita Express
  #   odpt.Railway:JR-East.Saikyo                      : Saikyo Line
  #   odpt.Railway:JR-East.Joban                       : Joban Line
  #   odpt.Railway:JR-East.Keiyo                       : Keiyo Line
  #   odpt.Railway:JR-East.Musashino                   : Musashino Line
  #   odpt.Railway:JR-East.Shinkansen                  : Tohoku, Akita, Yamagata, Joetsu and Nagano Shinkansen
  #   odpt.Railway:JR-Central.Shinkansen               : Tokaido and Sanyo Shinkansen
  #   odpt.Railway:Tokyu.Toyoko                        : Toyoko Line
  #   odpt.Railway:Tokyu.Meguro                        : Meguro Line
  #   odpt.Railway:Tokyu.DenEnToshi                    : Den-en-toshi Line
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : Minatomirai Line
  #   odpt.Railway:Odakyu.Odawara                      : Odawara Line
  #   odpt.Railway:Odakyu.Tama                         : Tama Line
  #   odpt.Railway:Odakyu.Enoshima                     : Enoshima Line
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : Hakone Tozan Line
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : Hakone Tozan Line
  #   odpt.Railway:Seibu.Ikebukuro                     : Ikebukuro Line
  #   odpt.Railway:Seibu.SeibuChichibu                 : Chichibu Line
  #   odpt.Railway:Seibu.Toshima                       : Toshima Line
  #   odpt.Railway:Seibu.Sayama                        : Sayama Line
  #   odpt.Railway:Seibu.SeibuYurakucho                : Seibu Yurakucho Line
  #   odpt.Railway:Seibu.Shinjuku                      : Shinjuku Line
  #   odpt.Railway:Tobu.SkyTreeIsesaki                 : Sky Tree and Isesaki Line
  #   odpt.Railway:Tobu.SkyTreeOshiage                 : Sky Tree Line (Oshiage - Hikifune)
  #   odpt.Railway:Tobu.SkyTree                        : Sky Tree Line
  #   odpt.Railway:Tobu.Isesaki                        : Isesaki Line
  #   odpt.Railway:Tobu.Nikko                          : Nikko Line
  #   odpt.Railway:Tobu.Kinugawa                       : Kinugawa Line
  #   odpt.Railway:Tobu.Tojo                           : Tojo Line
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : (nil)
  #   odpt.Railway:Keio.Keio                           : Keio Line
  #   odpt.Railway:Keio.New                            : New Line
  #   odpt.Railway:Keio.Inokashira                     : Inokashira Line
  #   odpt.Railway:Keisei.KeiseiMain                   : Main Line
  #   odpt.Railway:Keisei.KeiseiOshiage                : Oshiage Line
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : Yurikamome
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def name_en_normal
    get_name( name_en_to_a , allow_nil: true )
  end

  # 標準の路線記号を取得するメソッド
  # @return [::String or nil]
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_code_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : G
  #   odpt.Railway:TokyoMetro.Marunouchi               : M
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : m
  #   odpt.Railway:TokyoMetro.Hibiya                   : H
  #   odpt.Railway:TokyoMetro.Tozai                    : T
  #   odpt.Railway:TokyoMetro.Chiyoda                  : C
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : C
  #   odpt.Railway:TokyoMetro.Yurakucho                : Y
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Z
  #   odpt.Railway:TokyoMetro.Namboku                  : N
  #   odpt.Railway:TokyoMetro.Fukutoshin               : F
  #   odpt.Railway:Toei.Asakusa                        : A
  #   odpt.Railway:Toei.Mita                           : I
  #   odpt.Railway:Toei.Shinjuku                       : S
  #   odpt.Railway:Toei.Oedo                           : E
  #   odpt.Railway:Toei.NipporiToneri                  : (nil)
  #   odpt.Railway:Toei.TodenArakawa                   : (nil)
  #   odpt.Railway:JR-East                             : (nil)
  #   odpt.Railway:JR-East.Yamanote                    : (nil)
  #   odpt.Railway:JR-East.KeihinTohoku                : (nil)
  #   odpt.Railway:JR-East.Tokaido                     : (nil)
  #   odpt.Railway:JR-East.Yokosuka                    : (nil)
  #   odpt.Railway:JR-East.Takasaki                    : (nil)
  #   odpt.Railway:JR-East.Utsunomiya                  : (nil)
  #   odpt.Railway:JR-East.ShonanShinjuku              : (nil)
  #   odpt.Railway:JR-East.UenoTokyo                   : (nil)
  #   odpt.Railway:JR-East.Chuo                        : (nil)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : (nil)
  #   odpt.Railway:JR-East.ChuoSobu                    : (nil)
  #   odpt.Railway:JR-East.ChuoTozai                   : (nil)
  #   odpt.Railway:JR-East.SobuTozai                   : (nil)
  #   odpt.Railway:JR-East.Sobu                        : (nil)
  #   odpt.Railway:JR-East.NaritaExpress               : (nil)
  #   odpt.Railway:JR-East.Saikyo                      : (nil)
  #   odpt.Railway:JR-East.Joban                       : (nil)
  #   odpt.Railway:JR-East.Keiyo                       : (nil)
  #   odpt.Railway:JR-East.Musashino                   : (nil)
  #   odpt.Railway:JR-East.Shinkansen                  : (nil)
  #   odpt.Railway:JR-Central.Shinkansen               : (nil)
  #   odpt.Railway:Tokyu.Toyoko                        : TY
  #   odpt.Railway:Tokyu.Meguro                        : MG
  #   odpt.Railway:Tokyu.DenEnToshi                    : DT
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : MM
  #   odpt.Railway:Odakyu.Odawara                      : OH
  #   odpt.Railway:Odakyu.Tama                         : OT
  #   odpt.Railway:Odakyu.Enoshima                     : OE
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : OH
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : OH
  #   odpt.Railway:Seibu.Ikebukuro                     : SI
  #   odpt.Railway:Seibu.SeibuChichibu                 : SI
  #   odpt.Railway:Seibu.Toshima                       : SI
  #   odpt.Railway:Seibu.Sayama                        : SY
  #   odpt.Railway:Seibu.SeibuYurakucho                : SI
  #   odpt.Railway:Seibu.Shinjuku                      : SS
  #   odpt.Railway:Tobu.SkyTreeIsesaki                 : TS
  #   odpt.Railway:Tobu.SkyTreeOshiage                 : TS
  #   odpt.Railway:Tobu.SkyTree                        : TS
  #   odpt.Railway:Tobu.Isesaki                        : TI
  #   odpt.Railway:Tobu.Nikko                          : TN
  #   odpt.Railway:Tobu.Kinugawa                       : TN
  #   odpt.Railway:Tobu.Tojo                           : TJ
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : TR
  #   odpt.Railway:Keio.Keio                           : KO
  #   odpt.Railway:Keio.New                            : KO
  #   odpt.Railway:Keio.Inokashira                     : IK
  #   odpt.Railway:Keisei.KeiseiMain                   : KS
  #   odpt.Railway:Keisei.KeiseiOshiage                : KS
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : U
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def name_code_normal
    if has_name_codes?
      name_codes_to_a.first
    else
      nil
    end
  end

  def with_bold_railway_line_code_text?
    operated_by_tokyu? or operated_by_yokohama_minatomirai_railway? or operated_by_toyo_rapid_railway? or ( name_code_normal.present? and name_code_normal.length == 1 )
  end

  # @!group 支線

  def is_not_branch_railway_line_info
    !( is_branch_railway_line_info )
  end

  # @!group CSS に関するメソッド

  # CSS のクラスの名称
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.css_class }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : ginza
  #   odpt.Railway:TokyoMetro.Marunouchi               : marunouchi
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : marunouchi_branch
  #   odpt.Railway:TokyoMetro.Hibiya                   : hibiya
  #   odpt.Railway:TokyoMetro.Tozai                    : tozai
  #   odpt.Railway:TokyoMetro.Chiyoda                  : chiyoda
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : chiyoda_branch
  #   odpt.Railway:TokyoMetro.Yurakucho                : yurakucho
  #   odpt.Railway:TokyoMetro.Hanzomon                 : hanzomon
  #   odpt.Railway:TokyoMetro.Namboku                  : namboku
  #   odpt.Railway:TokyoMetro.Fukutoshin               : fukutoshin
  #   odpt.Railway:Toei.Asakusa                        : toei_asakusa
  #   odpt.Railway:Toei.Mita                           : toei_mita
  #   odpt.Railway:Toei.Shinjuku                       : toei_shinjuku
  #   odpt.Railway:Toei.Oedo                           : toei_oedo
  #   odpt.Railway:Toei.NipporiToneri                  : nippori_toneri
  #   odpt.Railway:Toei.TodenArakawa                   : toden_arakawa
  #   odpt.Railway:JR-East                             : jrs
  #   odpt.Railway:JR-East.Yamanote                    : jr_yamanote
  #   odpt.Railway:JR-East.KeihinTohoku                : jr_keihin_tohoku
  #   odpt.Railway:JR-East.Tokaido                     : jr_tokaido
  #   odpt.Railway:JR-East.Yokosuka                    : jr_yokosuka
  #   odpt.Railway:JR-East.Takasaki                    : jr_takasaki
  #   odpt.Railway:JR-East.Utsunomiya                  : jr_utsunomiya
  #   odpt.Railway:JR-East.ShonanShinjuku              : jr_shonan_shinjuku
  #   odpt.Railway:JR-East.UenoTokyo                   : jr_ueno_tokyo
  #   odpt.Railway:JR-East.Chuo                        : jr_chuo_limited_exp
  #   odpt.Railway:JR-East.ChuoKaisoku                 : jr_chuo_rapid
  #   odpt.Railway:JR-East.ChuoSobu                    : jr_chuo_and_sobu_local
  #   odpt.Railway:JR-East.ChuoTozai                   : jr_chuo_and_sobu_local_between_nakano_and_mitaka
  #   odpt.Railway:JR-East.SobuTozai                   : jr_chuo_and_sobu_local_between_nishi_funabashi_and_tsudanuma
  #   odpt.Railway:JR-East.Sobu                        : jr_sobu_rapid
  #   odpt.Railway:JR-East.NaritaExpress               : jr_narita_exp
  #   odpt.Railway:JR-East.Saikyo                      : jr_saikyo
  #   odpt.Railway:JR-East.Joban                       : jr_joban
  #   odpt.Railway:JR-East.Keiyo                       : jr_keiyo
  #   odpt.Railway:JR-East.Musashino                   : jr_musashino
  #   odpt.Railway:JR-East.Shinkansen                  : shinkansen_e
  #   odpt.Railway:JR-Central.Shinkansen               : shinkansen_c
  #   odpt.Railway:Tokyu.Toyoko                        : tokyu_toyoko
  #   odpt.Railway:Tokyu.Meguro                        : tokyu_meguro
  #   odpt.Railway:Tokyu.DenEnToshi                    : tokyu_den_en_toshi
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : yokohama_minatomirai_mm
  #   odpt.Railway:Odakyu.Odawara                      : odakyu_odawara
  #   odpt.Railway:Odakyu.Tama                         : odakyu_tama
  #   odpt.Railway:Odakyu.Enoshima                     : odakyu_enoshima
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : hakone_tozan
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : hakone_tozan
  #   odpt.Railway:Seibu.Ikebukuro                     : seibu_ikebukuro
  #   odpt.Railway:Seibu.SeibuChichibu                 : seibu_chichibu
  #   odpt.Railway:Seibu.Toshima                       : seibu_toshima
  #   odpt.Railway:Seibu.Sayama                        : seibu_sayama
  #   odpt.Railway:Seibu.SeibuYurakucho                : seibu_yurakucho
  #   odpt.Railway:Seibu.Shinjuku                      : seibu_shinjuku
  #   odpt.Railway:Tobu.SkyTreeIsesaki                 : tobu_sky_tree_and_isesaki
  #   odpt.Railway:Tobu.SkyTreeOshiage                 : tobu_sky_tree_oshiage_hikifune
  #   odpt.Railway:Tobu.SkyTree                        : tobu_sky_tree
  #   odpt.Railway:Tobu.Isesaki                        : tobu_isesaki
  #   odpt.Railway:Tobu.Nikko                          : tobu_nikko
  #   odpt.Railway:Tobu.Kinugawa                       : tobu_kinugawa
  #   odpt.Railway:Tobu.Tojo                           : tobu_tojo
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : saitama
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : toyo_rapid
  #   odpt.Railway:Keio.Keio                           : keio_line
  #   odpt.Railway:Keio.New                            : keio_new
  #   odpt.Railway:Keio.Inokashira                     : keio_inokashira
  #   odpt.Railway:Keisei.KeiseiMain                   : keisei_main
  #   odpt.Railway:Keisei.KeiseiOshiage                : keisei_oshiage
  #   odpt.Railway:MIR.TX                              : tsukuba_exp
  #   odpt.Railway:Yurikamome.Yurikamome               : yurikamome_line
  #   odpt.Railway:TWR.Rinkai                          : rinkai
  def css_class
    if marunouchi_branch_line?
      "marunouchi_branch"
    elsif chiyoda_branch_line?
      "chiyoda_branch"
    elsif shinkansen_of_jr_east?
      "shinkansen_e"
    elsif shinkansen_of_jr_central?
      "shinkansen_c"
    elsif minatomirai_line?
      "yokohama_minatomirai_mm"
    elsif keio_line?
      "keio_line"
    elsif yurikamome_line?
      "yurikamome_line"
    else
      super( :name_en_with_operator_name )
    end
  end

  # @!group Polymorphic method

  def railway_line
    self
  end

  # @!endgroup

  private

  def with_operator_name?
    !( tokyo_metro? or nippori_toneri_liner? or on_shinkansen? )
  end

end
