# @note Rails の model {::RailwayLine} には column 'is_branch_railway_line' が定義されているので、この module を include することができる。
module TokyoMetro::Modules::Common::Info::RailwayLine::Info

  include ::TokyoMetro::Modules::Common::Info::Fundamental::CssClass

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

  def marunouchi_branch_line?
    same_as == "odpt.Railway:TokyoMetro.MarunouchiBranch"
  end

  def chiyoda_branch_line?
    same_as == "odpt.Railway:TokyoMetro.ChiyodaBranch"
  end

  def toden_arakawa_line?
    same_as == "odpt.Railway:Toei.TodenArakawa"
  end

  def jr_lines?
    same_as == "odpt.Railway:JR-East"
  end

  def shinkansen_of_jr_east?
    [ "odpt.Railway:JR-East.Shinkansen" , "odpt.Railway:JR-East.Shinkansen.2015" , "odpt.Railway:JR-East.Shinkansen.2016" ].include?( same_as )
  end

  def shinkansen_of_jr_central?
    same_as == "odpt.Railway:JR-Central.Shinkansen"
  end

  def minatomirai_line?
    same_as == "odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai"
  end

  def tobu_sky_tree_isesaki_line?
    same_as == "odpt.Railway:Tobu.SkyTreeIsesaki"
  end

  def seibu_yurakucho_line?
    same_as == "odpt.Railway:Seibu.SeibuYurakucho"
  end

  def keio_line?
    same_as == "odpt.Railway:Keio.Keio"
  end

  def yurikamome_line?
    same_as == "odpt.Railway:Yurikamome.Yurikamome"
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
