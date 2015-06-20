# 赤坂見附駅のエスカレーター odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1 の利用可能日に関する情報を扱うモジュール
# @note {TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator}#service_detail の内部で、変数に対し、特異メソッドを追加するために prepend される。
module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::GinzaAkasakaMitsukeOutsideEscalator

  private

  # エスカレーターの利用可能日
  def operation_days
    "土日祝"
  end

end
