# 霞ケ関駅のエスカレーター odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4, odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5 の方向に関する情報を扱うモジュール
# @note {TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator}#service_detail の内部で、変数に対し、特異メソッドを追加するために prepend される。
module TokyoMetro::Modules::Api::ToFactory::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators

  private

  # エスカレーターの利用可能日
  def operation_days
    "平日"
  end

end
