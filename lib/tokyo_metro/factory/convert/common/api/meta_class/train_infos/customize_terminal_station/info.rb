# 列車の終着駅の名称 (same_as) をカスタマイズするためのクラス
# @note API からの情報のカスタマイズ
class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::CustomizeTerminalStation::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    customize_terminal_station
  end

  private

  def customize_terminal_station
    @object.instance_variable_set(
      :@terminal_station ,
      ::TokyoMetro::Modules::Common::Dictionary::Station.station_same_as_in_db( @object.terminal_station , "Terminal station" )
    )
  end

end
