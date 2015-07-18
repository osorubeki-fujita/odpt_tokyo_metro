class TokyoMetro::ApiProcessor::RealTimeInfos::RailwayLine::List < ::Array

  def has_any_train_operation_info?
    self.any?( &:has_train_operation_info? )
  end

  def dc_date_times_of_train_operation_info
    self.map( &:dc_date_time_of_train_operation_info ).sort
  end

  def validity_times_of_train_operation_info
    @infos_of_each_railway_line.map( &:train_operation_info ).map( &:validity )
  end

  def has_any_train_location?
    self.any?( &:has_any_train_location? )
  end

  def railway_line_infos
    self.map( &:railway_line )
  end

  def railway_line_infos_same_as
    self.map( &:railway_line_same_as )
  end

  def dc_date_times_of_train_location_info
    @infos_of_each_railway_line.map( &:train_location_infos ).flatten.map( &:dc_date )
  end

  def validity_times_of_train_location_info
    @infos_of_each_railway_line.map( &:train_location_infos ).flatten.map( &:validity )
  end

  def frequency_of_train_location_info
    @infos_of_each_railway_line.map( &:train_location_infos ).flatten.map( &:frequency )
  end

end
