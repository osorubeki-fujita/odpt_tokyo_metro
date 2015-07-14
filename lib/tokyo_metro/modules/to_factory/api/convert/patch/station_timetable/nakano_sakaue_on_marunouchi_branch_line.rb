# 丸ノ内支線に関連する情報を変換するための機能を提供するモジュールを格納する名前空間
# @note API からの情報の修正
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::NakanoSakaueOnMarunouchiBranchLine

  # モジュールをクラスにセットするためのモジュール関数
  # @return [nil]
  # @note {::TokyoMetro::Api::StationTimetable::Info} に対し {::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::NakanoSakaueOnMarunouchiBranchLine::Info} を prepend する。
  def self.set_modules
    ::TokyoMetro::Api::StationTimetable::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::NakanoSakaueOnMarunouchiBranchLine::Info
    end
  end

end
