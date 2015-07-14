# 路線名の正規表現を定数・モジュール関数として提供する名前空間
# @example
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.ginza_line                        => (?-mix:TokyoMetro\.Ginza)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.marunouchi_line                   => (?-mix:TokyoMetro\.Marunouchi)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.marunouchi_branch_line            => (?-mix:TokyoMetro\.MarunouchiBranch)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.hibiya_line                       => (?-mix:TokyoMetro\.Hibiya)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tozai_line                        => (?-mix:TokyoMetro\.Tozai)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.chiyoda_line                      => (?-mix:TokyoMetro\.Chiyoda)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.chiyoda_branch_line               => (?-mix:TokyoMetro\.ChiyodaBranch)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.yurakucho_line                    => (?-mix:TokyoMetro\.Yurakucho)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.hanzomon_line                     => (?-mix:TokyoMetro\.Hanzomon)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.namboku_line                      => (?-mix:TokyoMetro\.Namboku)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.fukutoshin_line                   => (?-mix:TokyoMetro\.Fukutoshin)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.marunouchi_line_including_branch  => (?-mix:TokyoMetro\.Marunouchi(?:Branch)?\.)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tobu_main_line                    => (?-mix:Tobu\.(?:SkyTree|Isesaki|SkyTreeOshiage|Nikko))
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tokyu_den_en_toshi_line           => (?-mix:Tokyu\.DenEnToshi)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.toyo_rapid_line                   => (?-mix:ToyoRapidRailway\.ToyoRapid)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.odakyu_line                       => (?-mix:Odakyu\.(?:Odawara|Tama|Enoshima))
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.odakyu_tama_line                  => (?-mix:Odakyu\.Tama)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.hakone_tozan_line                 => (?-mix:HakoneTozan\.Rail)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.jr_joban_line                     => (?-mix:JR\-East\.Joban)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.toei_mita_line                    => (?-mix:Toei\.Mita)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tokyu_meguro_line                 => (?-mix:Tokyu\.Meguro)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.saitama_railway_line              => (?-mix:SaitamaRailway\.SaitamaRailway)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.seibu_ikebukuro_line                        => (?-mix:Seibu\.Ikebukuro)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.seibu_line                        => (?-mix:Seibu\.(?:Ikebukuro|Sayama|Chichibu))
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tobu_tojo_line                    => (?-mix:Tobu\.Tojo)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.tokyu_toyoko_line                 => (?-mix:Tokyu\.Toyoko)
#   TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.minatomirai_line                  => (?-mix:YokohamaMinatomiraiRailway\.Minatomirai)
module TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo

  include ::TokyoMetro::Modules::Fundamental::ConvertConstantToClassMethod

  # @!group 東京メトロ各線

  ::YAML.load_file( "#{ ::TokyoMetro.dictionary_dir }/railway_line/tokyo_metro_lines_in_system.yaml" ).each do | item |
    const_set( eval( ":#{ item.underscore.upcase }_LINE" ) , /TokyoMetro\.#{ item }/ )
  end

  # @!group 丸ノ内線

  MARUNOUCHI_LINE_INCLUDING_BRANCH = /TokyoMetro\.Marunouchi(?:Branch)?\./

  # @!group 日比谷線・半蔵門線

  TOBU_MAIN_LINE = /Tobu\.(?:SkyTree|Isesaki|SkyTreeOshiage|Nikko)/
  TOKYU_DEN_EN_TOSHI_LINE = /Tokyu\.DenEnToshi/

  # @!group 東西線

  TOYO_RAPID_LINE = /ToyoRapidRailway\.ToyoRapid/

  # @!group 千代田線

  ODAKYU_LINE = /Odakyu\.(?:Odawara|Tama|Enoshima)/
  ODAKYU_TAMA_LINE = /Odakyu\.Tama/
  HAKONE_TOZAN_LINE = /HakoneTozan\.Rail/
  JR_JOBAN_LINE = /JR\-East\.Joban/

  # @!group 南北線

  TOEI_MITA_LINE = /Toei\.Mita/
  TOKYU_MEGURO_LINE = /Tokyu\.Meguro/
  SAITAMA_RAILWAY_LINE = /SaitamaRailway\.SaitamaRailway/

  # @!group 有楽町線・副都心線

  SEIBU_IKEBUKURO_LINE = /Seibu\.Ikebukuro/
  SEIBU_LINE = /Seibu\.(?:Ikebukuro|Sayama|Chichibu)/
  TOBU_TOJO_LINE = /Tobu\.Tojo/
  TOKYU_TOYOKO_LINE = /Tokyu\.Toyoko/
  MINATOMIRAI_LINE = /YokohamaMinatomiraiRailway\.Minatomirai/

end
