# 駅周辺の名所・施設に関する不正確な情報を修正する機能を提供するモジュールを格納する名前空間
# @note prepend {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::EscalatorDirectionAtOtemachi::Generate::Info::BarrierFree::Facility::Escalator} in {TokyoMetro::Factory::Generate::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info}
module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::SurroundingArea

  def self.set_modules
    ::TokyoMetro::Factory::Generate::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea
    end
  end

end
