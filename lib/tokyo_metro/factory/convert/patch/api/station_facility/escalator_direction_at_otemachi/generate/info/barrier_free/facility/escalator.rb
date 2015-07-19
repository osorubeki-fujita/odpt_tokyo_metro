class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator < TokyoMetro::Factory::Convert::Common::Api::StationFacility::BarrierFree::Facility::Escalator

  CHIYODA_OTEMACHI_OUTSIDE_ESCALATOR_1 = "odpt.StationFacility:TokyoMetro.Chiyoda.Otemachi.Outside.Escalator.1"

  FACILITY_NAMES = [
    CHIYODA_OTEMACHI_OUTSIDE_ESCALATOR_1
  ]

  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  private

  def to_process?
    FACILITY_NAMES.include?( same_as )
  end

  def replace_infos
    if same_as == CHIYODA_OTEMACHI_OUTSIDE_ESCALATOR_1
      module_name = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaOtemachiOutsideEscalator1
      @object = service_detail_infos_after_prepending_patch_module( module_name )
    end
  end

end
