# 駅施設情報内部のエスカレーターに関する不正確な情報を修正する機能を提供するモジュール
# @note {TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay.set_modules} により {TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::Facility::Escalator} へ include する。
# @note {TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators} は、TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorDirection::Generate::Info::BarrierFree::Facility::Escalator#service_detail の内部変数に対し、特異メソッドを追加するために prepend される。
module TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator

  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4"
  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5"

  include ::TokyoMetro::Modules::Common::ConvertConstantToClassMethod

  private

  def service_details
    case @hash[ "owl:sameAs" ]
    when CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 , CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5
      service_detail_ary_new = @hash[ "odpt:serviceDetail" ].map { | info_h |
        factory_instance = self.class.factory_for_generating_barrier_free_escalator_service_detail_from_hash.new( info_h )

        if info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == "20:00" and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == "終車時" and info_h[ "odpt:operationDays" ].blank?

          class << factory_instance
            prepend ::TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators
          end
        
        end

        factory_instance.generate
      }
      self.class.barrier_free_service_detail_list_class.new( service_detail_ary_new )
    else
      super
    end
  end

end
