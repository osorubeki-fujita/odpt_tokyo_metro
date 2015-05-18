class TokyoMetro::ApiProcessor::RealTimeInfos::ProvisionStatus::EachRailwayLine

  def initialize( train_operation_infos: :provided , train_location_infos: :provided )
    @train_operation_infos = train_operation_infos
    @train_location_infos = train_location_infos
  end

  attr_reader :train_operation_infos
  attr_reader :train_location_infos

  def train_operation_infos_are_provided?
    @train_operation_infos == :provided
  end

  def train_operation_infos_are_not_provided?
  !( train_operation_infos_are_provided? )
  end

  def train_location_infos_provided?
    @train_location_infos == :provided
  end

  def train_operation_infos_are_not_provided!
    @train_operation_infos = :not_provided
  end

  def train_location_infos_are_not_provided!
    @train_location_infos = :not_provided
  end

end