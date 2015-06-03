def static_stations
  ::TokyoMetro::Static.stations.each do | railway_line_name , infos_of_a_railway_line |
    describe ::TokyoMetro::Static::Station::InEachRailwayLine::Info , "(#{ railway_line_name })" do

      it "contains a station facility info." do
        infos_of_a_railway_line.each do | station_name , station_info |
          expect( station_info.station_facility_info ).to be_present
        end
      end

    end
  end
end
