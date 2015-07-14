# 駅時刻表の、列車の始発駅に関する情報を処理する機能を提供するモジュール
# @note API からの情報の修正
# @note {::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info} に対する機能
module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::Origin::Info::TrainTime::Info

  # Constructor
  # @return [::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info]
  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::Origin::Info::TrainTime::Info.process( self )
  end

end
