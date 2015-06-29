def get_info_from_api
  describe TokyoMetro::Api do

    describe "\#.get" do

      station_timetable_id_urns = [
        "urn:ucode:_00001C000000000000010000030C3D4B" ,
        "urn:ucode:_00001C000000000000010000030C3D4A" ,
        "urn:ucode:_00001C000000000000010000030C3D57"
      ]

      it "returns an instance of \'TokyoMetro::Api::Point::Info\'." do
        point_id_urn = "urn:ucode:_00001C000000000000010000030C40CF"
        point = ::TokyoMetro::Api.get( ::HTTPClient.new , point_id_urn , perse_json: true , generate_instance: true )
        expect( point.first ).to be_instance_of( ::TokyoMetro::Api::Point::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::Fare::Info\'." do
        fare_id_urn = "urn:ucode:_00001C000000000000010000030C567A"
        fare = ::TokyoMetro::Api.get( ::HTTPClient.new , fare_id_urn , perse_json: true , generate_instance: true )
        expect( fare.first ).to be_instance_of( ::TokyoMetro::Api::Fare::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::PassengerSurvey::Info\'." do
        passenger_survey_id_urn = "urn:ucode:_00001C000000000000010000030C461B"
        passenger_survey = ::TokyoMetro::Api.get( ::HTTPClient.new , passenger_survey_id_urn , perse_json: true , generate_instance: true )
        expect( passenger_survey.first ).to be_instance_of( ::TokyoMetro::Api::PassengerSurvey::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::Station::Info\'." do
        station_id_urn = "urn:ucode:_00001C000000000000010000030C4703"
        station = ::TokyoMetro::Api.get( ::HTTPClient.new , station_id_urn , perse_json: true , generate_instance: true )
        expect( station.first ).to be_instance_of( ::TokyoMetro::Api::Station::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::StationFacility::Info\'." do
        station_facility_id_urn = "urn:ucode:_00001C000000000000010000030C47F2"
        station_facility = ::TokyoMetro::Api.get( ::HTTPClient.new , station_facility_id_urn , perse_json: true , generate_instance: true )
        expect( station_facility.first ).to be_instance_of( ::TokyoMetro::Api::StationFacility::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::RailwayLine::Info\'." do
        railway_line_id_urn = "urn:ucode:_00001C000000000000010000030C46AC"
        railway_line = ::TokyoMetro::Api.get( ::HTTPClient.new , railway_line_id_urn , perse_json: true , generate_instance: true )
        expect( railway_line.first ).to be_instance_of( ::TokyoMetro::Api::RailwayLine::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::TrainTimetable::Info\'." do
        train_timetable_id_urn = "urn:ucode:_00001C000000000000010000030D16E4"
        train_timetable = ::TokyoMetro::Api.get( ::HTTPClient.new , train_timetable_id_urn , perse_json: true , generate_instance: true )
        expect( train_timetable.first ).to be_instance_of( ::TokyoMetro::Api::TrainTimetable::Info )
      end

      sleep( 0.2 )

      #--------

      it "returns an instance of \'TokyoMetro::Api::StationTimetable::Info\'." do
        station_timetable_id_urns.each do | station_timetable_id_urn |
          station_timetable = ::TokyoMetro::Api.get( ::HTTPClient.new , station_timetable_id_urn , perse_json: true , generate_instance: true )
          expect( station_timetable.first ).to be_instance_of( ::TokyoMetro::Api::StationTimetable::Info )
        end
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::StationTimetable::Info\'." do
        station_timetable_id_urns.each do | station_timetable_id_urn |
          station_timetable = ::TokyoMetro::Api::StationTimetable.get( ::HTTPClient.new , id_urn: station_timetable_id_urn , perse_json: true , generate_instance: true )
          expect( station_timetable.first ).to be_instance_of( ::TokyoMetro::Api::StationTimetable::Info )
        end
      end

      sleep( 0.2 )

    end

    describe "\#.get_geo" do

      it "returns an instance of \'TokyoMetro::Api::Point::Info\'." do
        point_id_urn = "urn:ucode:_00001C000000000000010000030C40CF"
        point = ::TokyoMetro::Api.get_geo( ::HTTPClient.new , point_id_urn , perse_json: true , generate_instance: true )
        expect( point.first ).to be_instance_of( ::TokyoMetro::Api::Point::Info )
      end

      it "returns an instance of \'TokyoMetro::Api::Station::Info\'." do
        station_id_urn = "urn:ucode:_00001C000000000000010000030C4703"
        station = ::TokyoMetro::Api.get_geo( ::HTTPClient.new , station_id_urn , perse_json: true , generate_instance: true )
        expect( station.first ).to be_instance_of( ::TokyoMetro::Api::Station::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::RailwayLine::Info\'." do
        railway_line_id_urn = "urn:ucode:_00001C000000000000010000030C46AC"
        railway_line = ::TokyoMetro::Api.get_geo( ::HTTPClient.new , railway_line_id_urn , perse_json: true , generate_instance: true )
        expect( railway_line.first ).to be_instance_of( ::TokyoMetro::Api::RailwayLine::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::MlitStation::Info\'." do
        mlit_station_id_urn = "urn:ucode:_00001C000000000000010000030BC6A5"
        mlit_station = ::TokyoMetro::Api.get_geo( ::HTTPClient.new , mlit_station_id_urn , perse_json: true , generate_instance: true )
        expect( mlit_station.first ).to be_instance_of( ::TokyoMetro::Api::MlitStation::Info )
      end

      sleep( 0.2 )

      it "returns an instance of \'TokyoMetro::Api::MlitRailway::Info\'." do
        mlit_railway_line_id_urn = "urn:ucode:_00001C000000000000010000030BBBAB"
        mlit_railway_line = ::TokyoMetro::Api.get_geo( ::HTTPClient.new , mlit_railway_line_id_urn , perse_json: true , generate_instance: true )
        expect( mlit_railway_line.first ).to be_instance_of( ::TokyoMetro::Api::MlitRailwayLine::Info )
      end

    end

  end
end
