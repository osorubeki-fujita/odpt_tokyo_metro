# 列車の始発駅の名称をカスタマイズするためのクラス
# @note API からの情報のカスタマイズ
class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::CustomizeStartingStation::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::StartingStation::Info

  private

  def station_name_new
    ::TokyoMetro::Modules::Common::Dictionary::Station.station_same_as_in_db( @object.starting_station , "Starting station" )
  end

  def to_process?
    true
  end

end
