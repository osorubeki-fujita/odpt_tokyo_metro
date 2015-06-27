# データ検索 API からデータを取得するための Factory Pattern の具体的なクラスを格納する名前空間／データ取得を行う Factory
# @note TokyoMetro::Factory::Get::Api::DataSearch::Xxxx は，{TokyoMetro::Factory::Get::Api::MetaClass::Search::DataSearch} を継承している．
# @note このクラス自身は，データ取得を行う Factory であり，TokyoMetro::Factory::Get::Api::DataSearch::Xxxx の親クラスではない．
class TokyoMetro::Factory::Get::Api::DataSearch < TokyoMetro::Factory::Get::Api::MetaClass::Find

  def access_point_url
    "#{ ::TokyoMetro::DATAPOINTS_URL }/#{ @data_id }"
  end

end
