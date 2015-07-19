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
    *defined_in_superclass , note = ary
    super( *defined_in_superclass )
    @note = note
    raise "Error: #{@same_as}" if @railway_line.nil?
  end

  # @return [String] 補足情報
  attr_reader :note

end
