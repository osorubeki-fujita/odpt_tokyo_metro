# 列車の終着駅の名称 (same_as) をカスタマイズするためのクラス
# @note API からの情報のカスタマイズ
class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::CustomizeTerminalStation::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::TerminalStation::Info

  private

  def station_name_new
    ::TokyoMetro::Modules::Common::Dictionary::Station.station_same_as_in_db( @object.terminal_station , "Terminal station" )
  end

end
