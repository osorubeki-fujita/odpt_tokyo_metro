# 地物検索 API からデータを取得するための Factory Pattern の具体的なクラスを格納する名前空間／データ取得を行う Factory
# @note TokyoMetro::Factory::Get::Api::Geo::Xxxx は，{TokyoMetro::Factory::Get::Api::MetaClass::Search::Geo} を継承している．
# @note このクラス自身は，データ取得を行う Factory であり，TokyoMetro::Factory::Get::Api::Geo::Xxxx の親クラスではない．
class TokyoMetro::Factory::Get::Api::Geo < TokyoMetro::Factory::Get::Api::MetaClass::Find

  def access_point_url
    "#{ ::TokyoMetro::PLACES_URL }/#{ @data_id }"
  end

end
