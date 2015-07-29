# 個別の列車種別の情報（実際に時刻表などのクラスから参照されるもの）を扱うクラス
class TokyoMetro::Static::TrainType::Custom::Main::Info < TokyoMetro::Static::TrainType::Custom::DefaultSetting::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::Custom::Main
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Info

  include ::TokyoMetro::Modules::Name::Common::TrainType::CssClass
  include ::TokyoMetro::Modules::Name::Common::TrainType::ColorBasename

  include ::OdptCommon::Modules::Color::Static::Fundamental::GetColorInfo
  # 色に関するメソッド
  include ::OdptCommon::Modules::Color::Static::Background
  include ::OdptCommon::Modules::Color::Static::Normal

  # Constructor
  # @param ary [::Array] 変数の配列（内部で展開する）
  def initialize( *ary )
    *defined_in_superclass , note , additional_infos , stopping_patterns ,  through_operation_infos , remarkable_stop_infos  , specific_operation_days= ary
    super( *defined_in_superclass )
    @note = note
    raise "Error: #{ @same_as }" if @railway_line.nil?

    @additional_infos = additional_infos

    @stopping_patterns = stopping_patterns
    @through_operation_infos = through_operation_infos
    @remarkable_stop_infos = remarkable_stop_infos
    @specific_operation_days = specific_operation_days
  end

  # @return [String] 補足情報
  attr_reader :note

  attr_reader :additional_infos

  attr_reader :stopping_patterns

  attr_reader :through_operation_infos
  attr_reader :remarkable_stop_infos
  attr_reader :specific_operation_days

end
