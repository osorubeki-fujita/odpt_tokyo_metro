# 列車の終着駅の名称 (same_as) をカスタマイズするためのクラス
# @note API からの情報のカスタマイズ
class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MetaClass::StationName::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object , station_attr )
    super( object )
    @station_attr = station_attr
  end

  def process
    if to_process?
      convert_station_name
    end
  end

  private

  def to_process?
    true
  end

  def convert_station_name
    @object.instance_variable_set(
      @station_attr ,
      station_name_new
    )
  end

  def station_name_new
    raise "This method '#{ __method__ }' is not defined in this class '#{ self.class }'."
  end

end
