class TokyoMetro::ApiProcessor::RealTimeInfos::ProvisionStatus::EachRailwayLine

  def initialize( train_operation_infos: :provided , train_locations: :provided )
    @train_operation_infos = train_operation_infos
    @train_locations = train_locations
  end

  attr_reader :train_operation_infos
  attr_reader :train_locations

  def train_operation_infos_are_provided?
    @train_operation_infos == :provided
  end

  def train_operation_infos_are_not_provided?
  !( train_operation_infos_are_provided? )
  end

  def train_locations_provided?
    @train_locations == :provided
  end

  def train_operation_infos_are_not_provided!
    @train_operation_infos = :not_provided
  end

  def train_locations_are_not_provided!
    @train_locations = :not_provided
  end

end