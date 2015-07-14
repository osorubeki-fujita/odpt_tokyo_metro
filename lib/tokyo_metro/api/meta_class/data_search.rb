# データ検索 API を利用する情報を扱うクラス（メタクラス）
class TokyoMetro::Api::MetaClass::DataSearch < TokyoMetro::Api::MetaClass::Fundamental

  include ::TokyoMetro::Modules::ToFactory::Api::Save::Info::DataSearch
  include ::TokyoMetro::Modules::ToFactory::Api::Save::Group::Normal
  include ::TokyoMetro::Modules::ToFactory::Api::Generate::Group::Normal

end
