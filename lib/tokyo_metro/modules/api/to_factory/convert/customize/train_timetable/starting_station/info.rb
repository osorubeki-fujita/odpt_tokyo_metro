module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::StartingStation::Info

  def initialize( *args )
    super( *args )
    set_starting_station
  end

  private

  def set_starting_station
    if @starting_station.nil?
      @starting_station = valid_list.first.station[ :departure ]
    end
  end

end
