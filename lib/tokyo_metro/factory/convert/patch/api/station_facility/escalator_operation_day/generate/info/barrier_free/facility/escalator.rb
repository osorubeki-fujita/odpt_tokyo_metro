class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator < TokyoMetro::Factory::Convert::Common::Api::StationFacility::BarrierFree::Facility::Escalator

  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4"
  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5"

  GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1 = "odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1"

  FACILITY_NAMES = [
    CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 ,
    CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 ,
    GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1
  ]

  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  private

  def to_process?
    FACILITY_NAMES.include?( same_as )
  end

  def replace_infos
    case same_as
    when CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 , CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5
      module_name = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators
      proc = proc_for_deciding_invalidity( "20:00" , "終車時"  )
      @object = service_detail_infos_after_prepending_patch_module( module_name , proc )

    when GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1
      module_name = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::GinzaAkasakaMitsukeOutsideEscalator
      proc = proc_for_deciding_invalidity( "始発" , "終車時" )
      @object = service_detail_infos_after_prepending_patch_module( module_name , proc )
    end
  end

  def proc_for_deciding_invalidity( service_start_time , service_end_time , operation_days = nil )
    ::Proc.new { | info_h |
      info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == service_start_time and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == service_end_time and ( ( operation_days.blank? and info_h[ "odpt:operationDays" ].blank? ) or ( operation_days.present? and info_h[ "odpt:operationDays" ] == operation_days ) )
    }
  end

end
