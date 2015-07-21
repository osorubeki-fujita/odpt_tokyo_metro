# 東京メトロの運賃の情報を扱うモジュール
module TokyoMetro::Static::Fare

  include ::TokyoMetro::ClassNameLibrary::Static::Fare
  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  # 最後の運賃改定が行われた日付
  # @return [::DateTime]
  # @note 現在の運賃は、2014年4月1日改定のもの。旧運賃は2014年3月31日の終電まで適用されていたため、2014年4月1日未明（3月31日の終電後）に現運賃へ切り替えが行われたものとする。
  # @note TokyoMetro::Static::Fare.last_revision で呼び出すことができる。
  LAST_REVISION = ::DateTime.new( 2014 , 4 , 1 , ::TokyoMetro.date_changing_hour , 0 , 0 )

  # 定数 {::TokyoMetro::Static::FARE_NORMAL_GROUPS} を設定するメソッド
  # @note {::TokyoMetro::Static.fare_normal_groups} で呼び出すこともできる。
  # @note {::TokyoMetro::Static::Fare::Normal.instance.current_faretable.list} は {::TokyoMetro::Static::Fare::Normal::Table::List} クラスのインスタンス
  # @return [:FARE_NORMAL_GROUPS]
  def self.set_constant
    ::TokyoMetro::Static.const_set( :FARE_NORMAL_GROUPS , self.fare_normal_group_class.instance.current_faretable.list )
  end

end
