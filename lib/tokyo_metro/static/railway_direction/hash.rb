# 方面の情報を扱うクラス（ハッシュ）
class TokyoMetro::Static::RailwayDirection::Hash < TokyoMetro::Static::Fundamental::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayDirection
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Hash

end