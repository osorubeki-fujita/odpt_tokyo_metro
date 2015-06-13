# 駅施設情報内部のエスカレーターに関する不正確な情報を修正する機能を提供するモジュール
# @note {TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay.set_modules} により {TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::Facility::Escalator} へ include する。
# @note {TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators} は、TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorDirection::Generate::Info::BarrierFree::Facility::Escalator#service_detail の内部変数に対し、特異メソッドを追加するために prepend される。
module TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator

  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4"
  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5"

  GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1 = "odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1"

  include ::TokyoMetro::Modules::Common::ConvertConstantToClassMethod

  private

  def service_details
    case @hash[ "owl:sameAs" ]

    when CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 , CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5

      proc_for_deciding_invalidity = ::Proc.new { | info_h |
        info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == "20:00" and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == "終車時" and info_h[ "odpt:operationDays" ].blank?
      }
      module_name = ::TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators
      service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )

    when GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1

      proc_for_deciding_invalidity = ::Proc.new { | info_h |
        info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == "始発" and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == "終車時" and info_h[ "odpt:operationDays" ].blank?
      }
      module_name = ::TokyoMetro::Modules::Api::Convert::Patches::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::GinzaAkasakaMitsukeOutsideEscalator
      service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )

    else
      super
    end
  end

  def service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )
    service_detail_ary_new =@hash[ "odpt:serviceDetail" ].map { | info_h |
      factory_instance = self.class.factory_for_generating_barrier_free_escalator_service_detail_from_hash.new( info_h )
      if proc_for_deciding_invalidity.call( info_h )
        # factory_instance.instance_eval do
          # prepend module_name
        # end
        puts "* #{ module_name }"
        eval <<-PREPEND
          class << factory_instance
            prepend ::#{ module_name }
          end
        PREPEND
      end
      factory_instance.generate
    }

    self.class.barrier_free_service_detail_list_class.new( service_detail_ary_new )
  end

end
