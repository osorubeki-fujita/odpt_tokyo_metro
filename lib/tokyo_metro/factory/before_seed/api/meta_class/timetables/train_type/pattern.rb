class TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainType::Pattern

  def initialize( pattern_id , train_type , railway_line_info_id , terminal_station_info_id , operation_day_id )
    @pattern_id = pattern_id
    @train_type = train_type
    @railway_line_info_id = railway_line_info_id
    @terminal_station_info_id = terminal_station_info_id
    @operation_day_id = operation_day_id
  end

  attr_reader :pattern_id

  def match?( train_type , railway_line_info_id , terminal_station_info_id , operation_day_id )
    train_type_is?( train_type ) and railway_line_is?( railway_line_info_id ) and terminal_station_is?( terminal_station_info_id ) and operation_day_is?( operation_day_id )
  end

  private

  def train_type_is?( train_type )
    @train_type == train_type
  end

  def railway_line_is?( railway_line_info_id )
    @railway_line_info_id == railway_line_info_id
  end

  def terminal_station_is?( terminal_station_info_id )
    @terminal_station_info_id == terminal_station_info_id
  end

  def operation_day_is?( operation_day_id )
    @operation_day_id == operation_day_id
  end

end
