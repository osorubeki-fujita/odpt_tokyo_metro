# データ検索 API と地物情報検索 API 両方を利用する情報を扱うクラス（メタクラス）
class TokyoMetro::Api::MetaClass::Hybrid < TokyoMetro::Api::MetaClass::Fundamental

  include ::TokyoMetro::Modules::ToFactory::Api::Save::Info::DataSearch
  include ::TokyoMetro::Modules::ToFactory::Api::Save::Group::Normal
  include ::TokyoMetro::Modules::ToFactory::Api::Generate::Group::Normal

  include ::TokyoMetro::Modules::ToFactory::Api::Get::Geo

end