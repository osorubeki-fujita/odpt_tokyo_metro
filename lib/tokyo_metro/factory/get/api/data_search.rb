# データ検索 API からデータを取得するための Factory Pattern の具体的なクラスを格納する名前空間／データ取得を行う Factory
class TokyoMetro::Factory::Get::Api::DataSearch < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental

  # Constructor
  def initialize( data_id , perse_json , generate_instance , to_inspect )
    super( perse_json , generate_instance , to_inspect )
    @data_id = data_id
  end

  def self.process( http_client , *args )
    self.new( *args ).get_data( http_client )
  end

  private

  def generate_new_array_instance( ary )
    if ary.empty?
      return ::Array.new
    else
      raise unless ary.all? { | item | item.instance_of?( ::Hash ) }
      raise unless ary.length == 1
      raise unless ary.first[ "@type" ].present?
      ary
    end
  end

  def access_point_url
    "#{ ::TokyoMetro::DATAPOINTS_URL }/#{ @data_id }"
  end

end
