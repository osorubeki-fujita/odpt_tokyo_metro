# 丸ノ内支線に関連する情報を変換するための機能を提供するモジュール
# @note API からの情報の修正
# @note {::TokyoMetro::Api::StationTimetable::Info} に対する機能
module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::StationTimetable::NakanoSakaueOnMarunouchiBranchLine::Info

  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NakanoSakaueOnMarunouchiBranchLine::Info.process( self )
  end

end
