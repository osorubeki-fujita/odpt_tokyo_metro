module TokyoMetro::Modules::Name::Common::TrainType::InApi

# @!group 種別の名称に関するメソッド (3) - 標準の名称

# 種別の名称（日本語、標準）
# @return [String]
# @example
#   TokyoMetro::Static.train_types_in_api.each_value { | train_type_info | puts train_type_info.same_as.ljust(48) + " " + train_type_info.name_ja_normal }
#   =>
#   odpt.TrainType:TokyoMetro.Local                  各停
#   odpt.TrainType:TokyoMetro.LimitedExpress         特急
#   odpt.TrainType:TokyoMetro.Express                急行
#   odpt.TrainType:TokyoMetro.HolidayExpress         急行
#   odpt.TrainType:TokyoMetro.SemiExpress            準急
#   odpt.TrainType:TokyoMetro.Rapid                  快速
#   odpt.TrainType:TokyoMetro.CommuterRapid          通勤快速
#   odpt.TrainType:TokyoMetro.ToyoRapid              東葉快速
#   odpt.TrainType:TokyoMetro.TamaExpress            多摩急行
#   odpt.TrainType:TokyoMetro.RomanceCar             特急
#   odpt.TrainType:TokyoMetro.RapidExpress           快速急行
#   odpt.TrainType:TokyoMetro.CommuterLimitedExpress 通勤特急
#   odpt.TrainType:TokyoMetro.CommuterExpress        通勤急行
#   odpt.TrainType:TokyoMetro.CommuterSemiExpress    通勤準急
#   odpt.TrainType:TokyoMetro.Unknown                不明
#   odpt.TrainType:TokyoMetro.Extra                  臨時
def name_ja_normal
  if name_ja_short.present?
    name_ja_short
  else
    name_ja
  end
end

# 種別の名称（ローマ字、標準）
# @return [String]
# @example
#   TokyoMetro::Static.train_types_in_api.each_value { | train_type_info | puts train_type_info.same_as.ljust(48) + " " + train_type_info.name_en_normal }
#   =>
#   odpt.TrainType:TokyoMetro.Local                  Local
#   odpt.TrainType:TokyoMetro.LimitedExpress         Limited Express
#   odpt.TrainType:TokyoMetro.Express                Express
#   odpt.TrainType:TokyoMetro.HolidayExpress         Express
#   odpt.TrainType:TokyoMetro.SemiExpress            Semi Express
#   odpt.TrainType:TokyoMetro.Rapid                  Rapid
#   odpt.TrainType:TokyoMetro.CommuterRapid          Commuter Rapid
#   odpt.TrainType:TokyoMetro.ToyoRapid              Toyo Rapid
#   odpt.TrainType:TokyoMetro.TamaExpress            Tama Express
#   odpt.TrainType:TokyoMetro.RomanceCar             Limited Express "Romance Car"
#   odpt.TrainType:TokyoMetro.RapidExpress           Rapid Express
#   odpt.TrainType:TokyoMetro.CommuterLimitedExpress Commuter Limited Express
#   odpt.TrainType:TokyoMetro.CommuterExpress        Commuter Express
#   odpt.TrainType:TokyoMetro.CommuterSemiExpress    Commuter Semi Express
#   odpt.TrainType:TokyoMetro.Unknown                Unknown
#   odpt.TrainType:TokyoMetro.Extra                  Extra
def name_en_normal
  if name_en_short.present?
    name_en_short
  else
    name_en
  end
end

# @!endgroup

end
