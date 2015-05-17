def stations_on_chiyoda_branch_line
  chiyoda_main = "odpt.Railway:TokyoMetro.Chiyoda"
  chiyoda_branch = "odpt.Railway:TokyoMetro.ChiyodaBranch"

  valid_name_of_ayase_main = "odpt.Station:TokyoMetro.Chiyoda.Ayase"
  valid_name_of_ayase_branch = "odpt.Station:TokyoMetro.ChiyodaBranch.Ayase"

  invalid_name_of_kita_ayase_main = "odpt.Station:TokyoMetro.Chiyoda.KitaAyase"
  valid_name_of_kita_ayase_branch = "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase"

  ayase = ::TokyoMetro::Api.stations.find { | item | item.same_as == valid_name_of_ayase_main }
  ayase_branch = ::TokyoMetro::Api.stations.find { | item | item.same_as == valid_name_of_ayase_branch }

  kita_ayase = ::TokyoMetro::Api.stations.find { | item | item.same_as == invalid_name_of_kita_ayase_main }
  kita_ayase_branch = ::TokyoMetro::Api.stations.find { | item | item.same_as == valid_name_of_kita_ayase_branch }

  describe TokyoMetro::Api::Station::Info , "after adding Chiyoda Branch Line" do

    describe "on Chiyoda Main Line (Yoyogi-uehara - Ayase)" do

      describe "Ayase" do

        it "exists" do
          expect(ayase ).to be_present
        end

        it "has attibute \'same_as\' and it is \'#{ valid_name_of_ayase_main }\'" do
          expect( ayase.same_as ).to eq( valid_name_of_ayase_main )
        end

        it "on Chiyoda Main Line" do
          expect( ayase.railway_line ).to eq( chiyoda_main )
        end

        describe TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
          # include odpt.Railway:TokyoMetro.ChiyodaBranch
          connecting_info_to_chiyoda_branch = ayase.connecting_railway_lines.find { | item | item.railway_line == chiyoda_branch }
          it "includes connecting railway info of Chiyoda Branch Line" do
            expect( connecting_info_to_chiyoda_branch ).to be_present
          end
        end

      end

      describe "Kita-ayase" do
        it "does not exist" do
          expect( kita_ayase ).not_to be_present
        end
      end

    end


    describe "on Chiyoda Branch Line (Ayase - Kita-ayase)" do

      describe "Ayase" do

        it "exists" do
          expect( ayase_branch ).to be_present
        end

        it "has attibute \'same_as\' and it is \'#{ valid_name_of_ayase_branch }\'" do
          expect( ayase_branch.same_as ).to eq( valid_name_of_ayase_branch )
        end

        it "on Chiyoda Branch Line" do
          expect( ayase_branch.railway_line ).to eq( chiyoda_branch )
        end

        it "does not have attiribute \'id_urn\'" do
          expect( ayase_branch.id_urn ).to be_nil
        end

        it "does not have attiribute \'dc_date\'" do
          expect( ayase_branch.dc_date ).to be_nil
        end

        describe TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
          # include odpt.Railway:TokyoMetro.Chiyoda
          connecting_info_to_chiyoda_main = ayase_branch.connecting_railway_lines.find { | item | item.railway_line == chiyoda_main }
          it "includes connecting railway info of Chiyoda Main Line" do
            expect( connecting_info_to_chiyoda_main ).to be_present
          end
        end

      end

      describe "Kita-ayase" do

        it "exists" do
          expect( kita_ayase_branch ).to be_present
        end

        it "has attibute \'same_as\' and it is \'#{ valid_name_of_kita_ayase_branch }\'" do
          expect( kita_ayase_branch.same_as ).to eq( valid_name_of_kita_ayase_branch )
        end

        it "on Chiyoda Branch Line" do
          expect( ayase_branch.railway_line ).to eq( chiyoda_branch )
        end

      end

    end

  end
end