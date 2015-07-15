# 個別の地物情報 ug:Poi のクラス
class TokyoMetro::Api::Point::Info < TokyoMetro::Api::MetaClass::Hybrid::Info

  include ::TokyoMetro::ClassNameLibrary::Api::Point
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Info

  # インスタンスメソッドの追加
  include ::TokyoMetro::Modules::Fundamental::Api::Info::ToJson
  include ::TokyoMetro::Modules::Fundamental::Api::Info::ToStringGeneral
  include ::TokyoMetro::Modules::Fundamental::Api::Info::ToStringWithArray

  # Constructor
  def initialize( id_urn , title , geo_long , geo_lat , region , ug_floor , category_name )
    @id_urn = id_urn

    @title = title
    @geo_long = geo_long
    @geo_lat = geo_lat
    @region = region

    @floor = ug_floor
    @category_name = category_name
  end

  # @!group 地理情報 (For developers)

  # 代表点の経度（10進表記）
  # @return [Float]
  attr_reader :geo_long

  # 代表点の緯度（10進表記）
  # @return [Float]
  attr_reader :geo_lat

  # 地物の形状データを GeoJSON で取得するためのURL <ug:region - odpt:GeoDocument>
  # @return [Integer]
  # @note 取得にはアクセストークンの付与が必要
  attr_reader :region

  # @!group 一般の情報

  # 地物のカテゴリ（必ず「出入口」となる） <ugsrv:categoryName - xsd:string>
  # @return [String]
  attr_reader :category_name

  # 地物の階数（高さ情報） <ug:floor - xsd:double>
  # @return [Integer]
  attr_reader :floor

  # 地物名 <dc:title - xsd:string>
  # @return [String]
  # @note エレベータには「エレベータ」という文字列を含む。「出入口」の文字列の後に出口番号が続く。
  attr_reader :title

  alias :longitude :geo_long
  alias :latitude :geo_lat
  alias :geo_json :region

  alias :category_name_ja :category_name

  # @!group 駅情報の取得

  # インスタンスの情報を文字列にして返すメソッド
  # @param indent [Integer (>=0)] インデントの幅
  # @return [String]
  def to_s( indent = 0 )
    to_s_with_array( [] , indent )
  end

  alias :to_strf :to_s

  # インスタンスの情報をハッシュにして返すメソッド
  # @return [Hash]
  def to_h
    h = Hash.new

    set_data_to_hash( h , "\@id" , @id_urn )
    set_data_to_hash( h , "dc:title" , @title.to_s )
    set_data_to_hash( h , "ug:region" , @region )

    set_data_to_hash( h , "ug:floor" , @floor )
    set_data_to_hash( h , "ugsrv:categoryName" , @category_name )

    set_data_to_hash( h , "geo:long" , @geo_long )
    set_data_to_hash( h , "geo:lat" , @geo_lat )

    h
  end

  # @!endgroup

  def additional_name
    _additional_name = @title.additional_name
    if _additional_name.blank?
      nil
    else
      _additional_name
    end
  end

  alias :additional_name_ja :additional_name

  def category_name_en
    str = ::TokyoMetro::Dictionary.english[ category_name_ja ]
    unless str.present?
      raise "Error: The category name of \"#{ @title.to_s }\" is not defined yet."
    end

    str
  end

  def additional_name_en
    str = ::TokyoMetro::Dictionary.english[ additional_name_ja ]
    #----
    str
  end

  [ :code , :has_elevator? , :closed? ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @title.#{ method_name }
      end
    DEF
  end

  [ :station_name , :code ].each do | method_base_name |
    eval <<-DEF
      def #{ method_base_name }_in_title
        @title.#{ method_base_name }
      end
    DEF
  end

  def station
    station_facility_key = nil
    ::TokyoMetro::Api::stations.each do | sta |
      if sta.exit_list.include?( @id_urn )
        if sta.facility.string?
          station_facility_key = sta.facility
        else
          station_facility_key = sta.facility.same_as
        end
        break
      end
    end

    if station_facility_key.present?
      station_facility_key
    else
      raise "Error"
    end
  end

end