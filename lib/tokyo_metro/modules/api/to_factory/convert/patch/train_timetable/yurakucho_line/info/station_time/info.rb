module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::YurakuchoLine::Info::StationTime::Info

  def convert_invalid_station_name_of_yurakucho_line
    arrival_station_new , departure_station_new = [ @arrival_station , @departure_station ].map { | station_name |
      if station_name.nil?
        nil
      else
        station_name.gsub( /\Aodpt\.Station\:TokyoMetro\.Yurakucho/ , "odpt.Station:TokyoMetro.Fukutoshin" )
      end
    }
    self.class.new( @arrival_time , arrival_station_new , @departure_time , departure_station_new )
  end

end
