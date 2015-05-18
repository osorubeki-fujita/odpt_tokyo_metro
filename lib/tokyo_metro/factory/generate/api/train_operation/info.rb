# API から取得したハッシュからインスタンスを生成するための Factory Pattern のクラス（メタクラス）
class TokyoMetro::Factory::Generate::Api::TrainOperation::Info < TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Api::TrainOperation

  # Info クラスに送る変数のリスト
  # @return [::Array]
  def variables
    id = @hash[ "\@id" ]
    dc_date = DateTime.parse( @hash[ "dc:date" ] )
    valid = DateTime.parse( @hash[ "dct:valid" ] )

    operator = @hash[ "odpt:operator" ]

    time_of_origin = DateTime.parse( @hash[ "odpt:timeOfOrigin" ] )

    railway_line = @hash[ "odpt:railway" ]
    info_status = @hash[ "odpt:trainInformationStatus" ]
    info_text = @hash[ "odpt:trainInformationText" ].process_train_operation_text

    [ id , dc_date , valid , operator , time_of_origin , railway_line , info_status , info_text ]
  end

end
