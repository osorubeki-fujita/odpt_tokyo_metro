# 駅施設情報に関する不正確な情報を修正する機能を提供するモジュールを格納する名前空間
# @note prepend {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator} in {TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::Facility::Escalator}
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::StationFacility::Info::BarrierFree::Info::Facility::Escalator.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator
    end
  end

end
