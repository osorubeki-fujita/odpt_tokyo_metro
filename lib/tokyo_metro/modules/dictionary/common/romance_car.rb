# ロマンスカーの列車番号と列車名の辞書を格納する名前空間
# @example
#   TokyoMetro::Modules::Dictionary::Common::RomanceCar.train_names =>
#     {
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A0952E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.Weekdays.21",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A1832E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.71",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A2040E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.41",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A2134E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.43",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A0952E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.21",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A1456E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.23",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.A1960E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.SaturdaysHolidays.43",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.B0630E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroSagami.Weekdays.70",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.B1454E.Weekdays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.Weekdays.22",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.B0750E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroSagami.SaturdaysHolidays.80",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.B1154E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.22",
#       "odpt.TrainTimetable:TokyoMetro.Chiyoda.B1758E.SaturdaysHolidays"=>"custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.24"
#     }
module TokyoMetro::Modules::Dictionary::Common::RomanceCar

  TRAIN_NAMES = ::YAML.load_file( "#{ ::TokyoMetro.dictionary_dir }/train_type/romance_car_train_names.yaml" )
  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

end
