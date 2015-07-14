# 駅施設情報内部のエスカレーターに関する不正確な情報を修正する機能を提供するモジュール
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator

  private

  def service_detail_infos
    ary = super()
    ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator.updated( ary , self )
  end

end
