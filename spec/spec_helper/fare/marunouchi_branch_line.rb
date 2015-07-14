def fares_related_to_marunouchi_branch_line
  valid_and_invalid_station_name_ary = ::TokyoMetro::Modules::Dictionary::Common::Station::StringList.between_honancho_and_nakano_shimbashi_including_invalid
  invalid_station_name_ary = ::TokyoMetro::Modules::Dictionary::Common::Station::StringList.between_honancho_and_nakano_shimbashi_invalid

  describe ::TokyoMetro::Api::Fare::Info , "after converting invalid \'from\' station name in Marunouchi Branch Line" do
    it "is from station on Marunouchi Branch Line." do

      ::TokyoMetro::Api.fares.each do | fare_info |
        if fare_info.from?( valid_and_invalid_station_name_ary )

          from_station = fare_info.from_station
          valid_station_name = fare_info.from_station.gsub( /Marunouchi(?:Branch)?\./ , "MarunouchiBranch." )
          same_as = fare_info.same_as

          # 出発駅
          expect( from_station ).to eq( valid_station_name )
        end
      end

    end

  end

  describe ::TokyoMetro::Api::Fare::Info , "after converting invalid \'to\' station name in Marunouchi Branch Line" do
    it "is to station on Marunouchi Branch Line" do

      ::TokyoMetro::Api.fares.each do | fare_info |
        if fare_info.to?( valid_and_invalid_station_name_ary )

          to_station = fare_info.to_station
          valid_station_name = fare_info.to_station.gsub( /Marunouchi(?:Branch)?\./ , "MarunouchiBranch." )
          same_as = fare_info.same_as

          # 到着駅
          expect( to_station ).to eq( valid_station_name )
        end
      end

    end
  end

end