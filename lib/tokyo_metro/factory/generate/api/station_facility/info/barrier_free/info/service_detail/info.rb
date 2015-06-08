# API から取得したハッシュからインスタンスを生成するための Factory Pattern のクラス（メタクラス）
class TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::ServiceDetail::Info < TokyoMetro::Factory::Generate::Api::MetaClass::Info::NotOnTheTopLayer

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility
  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility::BarrierFree::MetaClass

  def variables
    [ service_start_time , service_end_time , operation_days ]
  end

  private

  def service_start_time
    @hash[ "ugsrv:serviceStartTime" ].with_default_value( "始発" )
  end

  def service_end_time
    @hash[ "odpt:operationDays" ].with_default_value( "終車時" )
    # @hash[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" )
  end

  def operation_days
    @hash[ "odpt:operationDays" ]
  end

  def self.instance_class
    barrier_free_service_detail_info_class
  end

end
