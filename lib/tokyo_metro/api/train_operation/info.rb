# 個別の路線の運行情報を扱うクラス
class TokyoMetro::Api::TrainOperation::Info < TokyoMetro::Api::MetaClass::RealTime::Info

  include ::TokyoMetro::ClassNameLibrary::Api::TrainOperation

  include ::TokyoMetro::Modules::Common::Info::Decision::CompareBase
  include ::TokyoMetro::Modules::Api::Info::Decision::RailwayLine

  include ::TokyoMetro::Modules::Api::Info::ToStringGeneral

  # Constructor
  # @param id_urn [String] 固有識別子 (ucode) <id - URN>
  # @param date [DateTime] データ生成時刻（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @param valid [DateTime] 有効期限（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @param operator [String] 運行会社 <odpt:operator - odpt:Operator>
  # @param time_of_origin [DateTime] 発生時刻（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @param railway_line [String] 発生路線 <odpt:railway - odpt:Railway>
  # @param info_status [String] 運行ステータス <odpt:trainInformationStatus - xsd:string>
  # @param info_text [String] 運行情報テキスト <odpt:trainInformationText - xsd:string>
  # @note 運行ステータスは、平常時は省略。運行情報が存在する場合は「運行情報あり」を格納。遅延などの情報を取得可能な場合は、「遅延」等のテキストを格納。
  def initialize(
    id_urn ,
    dc_date , valid ,
    operator , time_of_origin , railway_line ,
    info_status , info_text
  )
    @id_urn = id_urn
    @dc_date , @valid = dc_date , valid
    @operator , @time_of_origin , @railway_line = operator , time_of_origin , railway_line
    @status , @text = info_status , info_text
  end

  # @!group 運行情報のメタデータ (For developers)

  # データ生成時刻（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @return [DateTime]
  # @example
  #  2013–01–13T15:10:00+09:00
  attr_reader :dc_date

  # 有効期限（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @return [DateTime]
  attr_reader :valid

  # @!group 運行情報のデータ (For users)

  # 運行会社 - odpt:Operator
  # @return [String]
  attr_reader :operator

  # 発生時刻（ISO8601 日付時刻形式をもとに生成した DateTime のインスタンス） - xsd:dateTime
  # @return [DateTime]
  attr_reader :time_of_origin

  # 発生路線 - odpt:Railway
  # @return [String]
  attr_reader :railway_line

  # 運行情報の文字列 - xsd:string
  # @return [String]
  # @note 平常時は省略する。運行情報が存在する場合は「運行情報あり」を格納し、遅延などの情報を取得可能な場合は、「遅延」等のテキストを格納する。
  attr_reader :status

  # 運行情報テキスト - xsd:string
  # @return [String]
  attr_reader :text

  alias :to_strf :to_s

  def decorate( request , railway_line , max_delay , controller , no_train )
    ::TokyoMetro::Factory::Decorate::Api::TrainOperation::Info.new( request , self , railway_line , max_delay , controller , no_train )
  end

  # インスタンスの情報をハッシュにして返すメソッド
  # @return [Hash]
  def to_h
    h = Hash.new

    set_data_to_hash( h , "odpt:operator" , @operator )
    set_data_to_hash( h , "odpt:railway" , @railway_line )

    set_data_to_hash( h , "\@id" , @id_urn )
    set_data_to_hash( h , "dc:date" , @dc_date.to_s )
    set_data_to_hash( h , "dct:valid" , @valid.to_s )

    set_data_to_hash( h , "odpt:timeOfOrigin" , @time_of_origin.to_s )
    set_data_to_hash( h , "odpt:trainInformationStatus" , @status )
    set_data_to_hash( h , "odpt:trainInformationText" , @text )

    h
  end

  # @!endgroup

  def train_operation_status
    if @status.present?
      status_in_db = ::TrainOperation::Status.find_by( in_api: @status )
      if status_in_db.present?
        status_in_db
      else
        ::TrainOperation::Status.create( in_api: @status , id: ::TrainOperation::Status.pluck(:id).max + 1 )
      end
    else
      nil
    end
  end

  def train_operation_text
    text_in_db = ::TrainOperation::Text.find_by( in_api: @text )
    if text_in_db.present?
      text_in_db
    else
      ::TrainOperation::Text.create( in_api: @text , id: ::TrainOperation::Text.pluck(:id).max + 1 )
    end
  end

  def text_in_api
    train_operation_text.in_api
  end

  def text_en
    if on_schedule?
      "Trains are operated on schedule."
    else
      nil
    end
  end

  def place
    train_operation_text.place
  end

  def on_schedule?
    train_operation_text.on_schedule?
  end

  def delayed?
    !!( train_operation_status.try( :delayed? ) )
  end

  def suspended?
    !!( train_operation_status.try( :suspended? ) )
  end

end
