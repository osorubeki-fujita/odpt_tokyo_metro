# API から取得したハッシュからインスタンスを生成するための Factory Pattern のクラス（メタクラス）
class TokyoMetro::Factory::Generate::Api::TrainInformation::Info < TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Api::TrainInformation

  # Info クラスに送る変数のリスト
  # @return [::Array]
  def variables
    id = @hash[ "\@id" ]
    dc_date = DateTime.parse( @hash[ "dc:date" ] )
    valid = DateTime.parse( @hash[ "dct:valid" ] )

    operator = @hash[ "odpt:operator" ]

    time_of_origin = DateTime.parse( @hash[ "odpt:timeOfOrigin" ] )

    railway_line = @hash[ "odpt:railway" ]
    train_operation_info_status = @hash[ "odpt:trainInformationStatus" ]
    train_operation_info_text = @hash[ "odpt:trainInformationText" ].process_train_operation_info_text

    [ id , dc_date , valid , operator , time_of_origin , railway_line , train_operation_info_status , train_operation_info_text ]
  end

end