# API から取得したハッシュからインスタンスを生成するための Factory Pattern のクラス（メタクラス）
class TokyoMetro::Factory::Generate::Api::Fare::Info < TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Api::Fare

  # Info クラスに送る変数のリスト
  # @return [::Array]
  def variables
    id = @hash[ "\@id" ]
    same_as = @hash[ "owl:sameAs" ]
    dc_date = DateTime.parse( @hash[ "dc:date" ] )
    operator = @hash[ "odpt:operator" ]
    from_station = @hash[ "odpt:fromStation" ]
    to_station = @hash[ "odpt:toStation" ]

    fares = [ "odpt:ticketFare" , "odpt:childTicketFare" , "odpt:icCardFare" , "odpt:childIcCardFare" ].map { | key | @hash[ key ] }
    fare_normal_group = ::TokyoMetro::Static.fare_normal_group.select_fare( *fares )

    [ id , same_as , dc_date , operator , from_station , to_station , fare_normal_group ]
  end

end
