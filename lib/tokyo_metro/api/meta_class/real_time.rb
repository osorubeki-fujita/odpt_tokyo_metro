# データ検索 API を利用する、リアルタイム情報を扱うクラス（メタクラス）
class TokyoMetro::Api::MetaClass::RealTime < TokyoMetro::Api::MetaClass::DataSearch

  include ::TokyoMetro::Modules::Fundamental::Api::Common::RealTime
  include ::TokyoMetro::Modules::ToFactory::Api::Generate::Group::Date

end