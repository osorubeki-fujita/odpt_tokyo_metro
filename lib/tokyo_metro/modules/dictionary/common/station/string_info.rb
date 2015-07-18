# 駅名を定数・モジュール関数として提供する名前空間
# @example
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ikebukuro_on_marunouchi_line => odpt.Station:TokyoMetro.Marunouchi.Ikebukuro
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.honancho                              => odpt.Station:TokyoMetro.MarunouchiBranch.Honancho
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_fujimicho                      => odpt.Station:TokyoMetro.MarunouchiBranch.NakanoFujimicho
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_shimbashi                      => odpt.Station:TokyoMetro.MarunouchiBranch.NakanoShimbashi
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_sakaue_on_marunouchi_line      => odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_sakaue_on_marunouchi_branch_line => odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ogikubo                               => odpt.Station:TokyoMetro.Marunouchi.Ogikubo
#
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.honancho_invalid                      => odpt.Station:TokyoMetro.Marunouchi.Honancho
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_fujimicho_invalid              => odpt.Station:TokyoMetro.Marunouchi.NakanoFujimicho
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_shimbashi_invalid              => odpt.Station:TokyoMetro.Marunouchi.NakanoShimbashi
#
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.mitaka                                => odpt.Station:JR-East.ChuoTozai.Mitaka
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.tsudanuma                             => odpt.Station:JR-East.SobuTozai.Tsudanuma
#
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.yoyogi_uehara                         => odpt.Station:TokyoMetro.Chiyoda.YoyogiUehara
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ayase_on_chiyoda_main_line            => odpt.Station:TokyoMetro.Chiyoda.Ayase
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ayase_on_chiyoda_branch_line          => odpt.Station:TokyoMetro.ChiyodaBranch.Ayase
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kita_ayase_on_chiyoda_branch_line     => odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kita_ayase_on_chiyoda_main_line       => odpt.Station:TokyoMetro.Chiyoda.KitaAyase
#
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.shirokane_takanawa                    => odpt.Station:TokyoMetro.Namboku.ShirokaneTakanawa
#
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.wakoshi_on_yurakucho_line             => odpt.Station:TokyoMetro.Yurakucho.Wakoshi
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.wakoshi_on_fukutoshin_line            => odpt.Station:TokyoMetro.Fukutoshin.Wakoshi
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kotake_mukaihara_on_yurakucho_line    => odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kotake_mukaihara_on_fukutoshin_line   => odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ikebukuro_on_yurakucho_line           => odpt.Station:TokyoMetro.Yurakucho.Ikebukuro
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ikebukuro_on_fukutoshin_line          => odpt.Station:TokyoMetro.Fukutoshin.Ikebukuro
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.shinjuku_sanchome_on_fukutoshin_line          => odpt.Station:TokyoMetro.Fukutoshin.ShinjukuSanchome
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.shibuya_on_fukutoshin_line          => odpt.Station:TokyoMetro.Fukutoshin.Shibuya
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.motomachi_chukagai                    => odpt:Station.YokohamaMinatomiraiRailway.Minatomirai.MotomachiChukagai
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.toyosu             => odpt.Station:TokyoMetro.Yurakucho.Toyosu
#   TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.shin_kiba             => odpt.Station:TokyoMetro.Yurakucho.ShinKiba
module TokyoMetro::Modules::Dictionary::Common::Station::StringInfo

  include ::OdptCommon::Modules::MethodMissing::Constant::Common::ConvertToClassMethod

  ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/station/frequently_appeared.yaml" ).each do | const_name , v |
    const_set( eval( ":#{ const_name.upcase }" ) , v )
  end

end
