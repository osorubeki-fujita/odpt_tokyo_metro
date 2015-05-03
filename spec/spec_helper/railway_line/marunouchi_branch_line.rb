def railway_line_info_of_marunouchi_branch_line
  marunouchi_line = ::TokyoMetro::Api.railway_lines.find { | item | item.same_as == "odpt.Railway:TokyoMetro.Marunouchi" }
  marunouchi_branch_line = ::TokyoMetro::Api.railway_lines.find { | item | item.same_as == "odpt.Railway:TokyoMetro.MarunouchiBranch" }

  describe ::TokyoMetro::Api::RailwayLine::List , "check Marunouchi Main Line" do

    describe ::TokyoMetro::Api::RailwayLine::Info , "of Marunouchi Main Line (Ogikubo - Ikebukuro)" do

      it "is present" do
        expect( marunouchi_line ).to be_present
      end

      describe "station_order" do
        it "contains stations on Marunouchi Main Line." do
          marunouchi_line.station_order.each do | info |
            expect( info.station ).to match( /Marunouchi\.[[:alpha:]]+\Z/ )
            expect( info.station ).not_to match( /(?:Nakano(?:Shimbashi|Fujimicho)|Honancho)/ )
          end
        end
      end

      describe "travel_time" do
        it "contains infos between stations on Marunouchi Main Line." do
          marunouchi_line.travel_time.each do | info |
            [ info.from_station , info.to_station ].each do | station |
              expect( station ).to match( /Marunouchi\.[[:alpha:]]+\Z/ )
              expect( station ).not_to match( /MarunouchiBranch\.(?:Nakano(?:Shimbashi|Fujimicho)|Honancho)\Z/ )
            end
          end
        end
      end

    end

    describe ::TokyoMetro::Api::RailwayLine::Info , "of Marunouchi Branch Line (Honancho - Nakano-sakaue)" do

      it "is present" do
        expect( marunouchi_line ).to be_present
      end

      describe "station_order" do
        it "contains stations on Marunouchi Branch Line." do
          marunouchi_branch_line.station_order.each do | info |
            expect( info.station ).not_to match( /Marunouchi\.[[:alpha:]]+\Z/ )
            expect( info.station ).to match( /MarunouchiBranch\.(?:Nakano(?:Sakaue|Shimbashi|Fujimicho)|Honancho)\Z/ )
          end
        end
      end

      describe "travel_time" do
        it "contains infos between stations on Marunouchi Branch Line." do
          marunouchi_branch_line.travel_time.each do | info |
            [ info.from_station , info.to_station ].each do | station |
              expect( station ).not_to match( /Marunouchi\.[[:alpha:]]+\Z/ )
              expect( station ).to match( /MarunouchiBranch\.(?:Nakano(?:Sakaue|Shimbashi|Fujimicho)|Honancho)\Z/ )
            end
          end
        end
      end

    end

  end

end