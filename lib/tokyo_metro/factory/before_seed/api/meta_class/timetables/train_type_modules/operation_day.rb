module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::OperationDay

  private

  # @!group 運行日に関するメソッド

  def operated_on_holiday?
    @operation_day_in_db.holiday?
  end

  # @!endgroup

end
