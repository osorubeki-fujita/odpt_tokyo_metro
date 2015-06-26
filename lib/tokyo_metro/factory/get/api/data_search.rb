# データ検索 API からデータを取得するための Factory Pattern の具体的なクラスを格納する名前空間／データ取得を行う Factory
class TokyoMetro::Factory::Get::Api::DataSearch < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental

  # Constructor
  def initialize( http_client , id_urn , perse_json , generate_instance , to_inspect )
    super( perse_json , generate_instance , to_inspect )
    @id = id_urn
  end

  def self.process( http_client , *args )
    self.new( *args ).get_data( http_client )
  end

  private

  def access_point_url
    "#{ ::TokyoMetro::DATAPOINTS_URL }/#{ @id }"
  end

end
