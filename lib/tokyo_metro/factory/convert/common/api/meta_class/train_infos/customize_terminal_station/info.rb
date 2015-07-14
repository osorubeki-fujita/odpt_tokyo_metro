# 列車の終着駅の名称をカスタマイズするためのクラス
# @note API からの情報のカスタマイズ
class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::CustomizeTerminalStation::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::TerminalStation::Info

  private

  def station_name_new
    ::TokyoMetro::Modules::Dictionary::Common::Station.station_same_as_in_db( @object.terminal_station , "Terminal station" )
  end

  def to_process?
    true
  end

end
