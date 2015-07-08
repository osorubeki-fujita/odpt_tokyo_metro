class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::StartingStation::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::CustomizeStartingStation::Info

  def process
    set_starting_station
    super
  end

  private

  def set_starting_station
    unless @object.starting_station.present?
      @object.instance_variable_set( :@starting_station , @object.valid_list.first.station[ :departure ] )
    end
  end

end
