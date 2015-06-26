# データ検索 API からデータを取得するための Factory Pattern の具体的なクラスを格納する名前空間／データ取得を行う Factory
class TokyoMetro::Factory::Get::Api::DataSearch < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental

  # Constructor
  def initialize( data_id , *args )
    super( *args )
    @data_id = data_id
  end

  def self.process( http_client , *args )
    self.new( *args ).get_data( http_client )
  end

  private

  def generate_new_array_instance( ary )
    ::TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Find.process( ary )
  end

  def access_point_url
    "#{ ::TokyoMetro::DATAPOINTS_URL }/#{ @data_id }"
  end

end
