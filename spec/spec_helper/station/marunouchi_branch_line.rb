def stations_on_marunouchi_branch_line
  nakano_sakaue_main = ::TokyoMetro::Api.stations.find { | item | /Marunouchi\.NakanoSakaue\Z/ === item.same_as }
  nakano_shimbashi_main = ::TokyoMetro::Api.stations.find { | item | /Marunouchi\.NakanoShimbashi\Z/ === item.same_as }
  nakano_fujimicho_main = ::TokyoMetro::Api.stations.find { | item | /Marunouchi\.NakanoFujimicho\Z/ === item.same_as }
  honancho_main = ::TokyoMetro::Api.stations.find { | item | /Marunouchi\.Honancho\Z/ === item.same_as }

  nakano_sakaue_branch = ::TokyoMetro::Api.stations.find { | item | /MarunouchiBranch\.NakanoSakaue\Z/ === item.same_as }
  nakano_shimbashi_branch = ::TokyoMetro::Api.stations.find { | item | /MarunouchiBranch\.NakanoShimbashi\Z/ === item.same_as }
  nakano_fujimicho_branch = ::TokyoMetro::Api.stations.find { | item | /MarunouchiBranch\.NakanoFujimicho\Z/ === item.same_as }
  honancho_branch = ::TokyoMetro::Api.stations.find { | item | /MarunouchiBranch\.Honancho\Z/ === item.same_as }

  invalid_stations_on_main = [
    [ "Honancho" , honancho_main ] ,
    [ "Nakano-fujimicho" , nakano_fujimicho_main ] ,
    [ "Nakano-shimbashi" , nakano_shimbashi_main ]
  ]

  stations_on_branch = [
    [ "Honancho" , honancho_branch ] ,
    [ "Nakano-fujimicho" , nakano_fujimicho_branch ] ,
    [ "Nakano-shimbashi" , nakano_shimbashi_branch ] ,
    [ "Nakano-sakaue" , nakano_sakaue_branch ]
  ]

  describe ::TokyoMetro::Api::Station::Info , "of Marunouchi Branch Line" do

    describe "on Marunouchi Main Line (Ogikubo - Ikebukuro)" do

      describe "Nakano-sakaue" do

        it "exists" do
          expect( nakano_sakaue_main ).to be_present
        end

        it "is on Marunouchi Main Line" do
          expect( nakano_sakaue_main.railway_line ).to eq( "odpt.Railway:TokyoMetro.Marunouchi" )
        end

        describe TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
          # not include odpt.Railway:TokyoMetro.MarunouchiBranch
          connecting_info_to_marunouchi_branch = nakano_sakaue_main.connecting_railway_line_infos.find { | item | item.railway_line == "odpt.Railway:TokyoMetro.MarunouchiBranch" }
          it "includes connecting railway info to Marunouchi Branch Line" do
            expect( connecting_info_to_marunouchi_branch ).to be_present
          end
        end

      end

      describe "Honancho, Nakano-fujimicho and Nakano-shimbashi" do

        invalid_stations_on_main.each do | station_name , var |
          describe station_name do
            it "does not exist" do
              expect( var ).not_to be_present
            end
          end
        end

      end

    end


    describe "on Marunouchi Branch Line (Honancho - Nakano-sakaue)" do

      describe "Nakano-sakaue" do
        it "exists" do
          expect( nakano_sakaue_branch ).to be_present
        end

        it "is on Marunouchi Branch Line" do
          expect( nakano_sakaue_branch.railway_line ).to eq( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
        end

        describe TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
          # not include odpt.Railway:TokyoMetro.Marunouchi
          connecting_info_to_marunouchi_main = nakano_sakaue_branch.connecting_railway_line_infos.find { | item | item.railway_line == "odpt.Railway:TokyoMetro.Marunouchi" }
          it "includes connecting railway info to Marunouchi Main Line" do
            expect( connecting_info_to_marunouchi_main ).to be_present
          end
        end

      end

      describe "Honancho, Nakano-fujimicho and Nakano-shimbashi" do

        stations_on_branch.each_with_index do | ( station_name , var ) , i |
          describe station_name do
            it "exists" do
              expect( var ).to be_present
            end

            it "is on Marunouchi Branch Line" do
              expect( var.railway_line ).to eq( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
            end

            it "has station code that begins with \'m\'" do
              expect( var.station_code ).to eq( "m0#{ i + 3 }" )
            end

          end
        end

      end

    end

  end

end
