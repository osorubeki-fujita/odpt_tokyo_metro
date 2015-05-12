class TokyoMetro::ApiProcessor::RealTimeInfos::ProvisionStatus::EachRailwayLine

  def initialize( train_informations: :provided , train_locations: :provided )
    @train_informations = train_informations
    @train_locations = train_locations
  end

  attr_reader :train_informations
  attr_reader :train_locations

  def train_informations_are_provided?
    @train_informations == :provided
  end

  def train_informations_are_not_provided?
  !( train_informations_are_provided? )
  end

  def train_locations_provided?
    @train_locations == :provided
  end

  def train_informations_are_not_provided!
    @train_informations = :not_provided
  end

  def train_locations_are_not_provided!
    @train_locations = :not_provided
  end

end

__END__

運行中の列車 なし
No train is operated now.
折返し運転
本日の運行は終了しました。
Shuttle service is provided in section with no effect by accidents.
Today's operation was finished.


運行中の列車 なし
No train is operated now.
ダイヤ乱れ
本日の運行は終了しました。
Trains are behind schedule.
Today's operation was finished.

東急田園都市線内での東急線内遅延により、一部の列車に遅れが出ています。