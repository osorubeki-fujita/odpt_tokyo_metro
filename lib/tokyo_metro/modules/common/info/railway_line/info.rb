# @note Rails の model {::RailwayLine} には column 'is_branch_railway_line' が定義されているので、この module を include することができる。
module TokyoMetro::Modules::Common::Info::RailwayLine::Info

  include ::TokyoMetro::Modules::Common::Info::Fundamental::CssClass

  # @!group 名称（日本語）

  def has_name_ja?
    name_ja_to_a.present?
  end

  def has_one_name_ja?
    name_ja_to_a.length == 1
  end

  def has_many_name_ja?
    name_ja_to_a.length > 1
  end

  # @!group 名称（ローマ字）

  def has_name_en?
    name_en_to_a.present?
  end

  def has_one_name_en?
    name_en_to_a.length == 1
  end

  def has_many_name_en?
    name_en_to_a.length > 1
  end

  # @!group 路線記号

  def has_name_codes?
    name_codes.present?
  end

  def has_one_name_code?
    name_codes.length == 1
  end

  def has_many_name_codes?
    name_codes.length > 1
  end

  # @!group 路線記号

  # 標準の路線記号を取得するメソッド
  # @return [::String or nil]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_code_normal }
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

  def is_not_branch_railway_line
    !( is_branch_railway_line )
  end

  # @!group CSS に関するメソッド

  # CSS のクラスの名称
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.css_class }
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

  # @!endgroup

  private

  def with_operator_name?
    !( tokyo_metro? or nippori_toneri_liner? or shinkansen? )
  end

  def railway_line
    self
  end

  def method_missing( method_name , *args )
    if args.empty?
      if /\A((?:is|is_not|not)_)?branch(?:_railway)?(?:_line)?\?\Z/ =~ method_name.to_s
        valid_method_name = "is_" + $1.to_s.gsub( /is_/ , "" ) + "branch_railway_line"
        return send( valid_method_name )
      elsif /\Ahas_branch(?:_railway)?(?:_line)?\?\Z/ =~ method_name.to_s
        valid_method_name = "has_branch_railway_line"
        return send( valid_method_name )
      end
    end
    super( method_name , *args )
  end

end
