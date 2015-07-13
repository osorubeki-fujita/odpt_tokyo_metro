# 駅施設情報内部のエスカレーターに関する不正確な情報を修正する機能を提供するモジュール
# @note {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi.set_modules} により {TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::Facility::Escalator} へ include する。
# @note {TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaOtemachiOutsideEscalator1} は、TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator#service_detail の内部変数に対し、特異メソッドを追加するために prepend される。
module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator

  private

  def service_detail_infos
    ary = super()
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator.updated( ary , self )
  end

end
