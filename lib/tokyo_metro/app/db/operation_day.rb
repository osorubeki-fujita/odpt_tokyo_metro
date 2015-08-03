class TokyoMetro::App::Db::OperationDay

  def initialize( datetime )
    @time = datetime
  end

  def process
    if saturday_or_sunday? or holiday?
      ::OperationDay.find_by( same_as: "custom:OperationDay:SaturdayHoliday" )
      # ::OperationDay.find_by( same_as: "custom:OperationDay:SaturdaySundayHoliday" )
    else
      ::OperationDay.find_by( same_as: "custom:OperationDay:Weekday" )
    end
  end

  def self.select_by( datetime )
    self.new( datetime ).process
  end

  private

  def saturday_or_sunday?
    @time.saturday? or @time.sunday?
  end

  def holiday?
    @time.holiday?
  end

end
