def railway_line_info_of_chiyoda_branch_line

  # 千代田線（本線）
  chiyoda_line = ::TokyoMetro::Api.railway_line_infos.find( &:chiyoda_line? )
  # 千代田線（支線）
  chiyoda_branch_line = ::TokyoMetro::Api.railway_line_infos.find( &:chiyoda_branch_line? )

  # 千代田線（本線）の、北綾瀬駅の順番
  chiyoda_line_station_order_kita_ayase = chiyoda_line.station_order.find { | item | item.station == "odpt.Station:TokyoMetro.Chiyoda.KitaAyase"}
  # 千代田線（本線）の、綾瀬 - 北綾瀬の所要時間
  chiyoda_line_travel_time_between_ayase_and_kita_ayase = chiyoda_line.travel_time.select { | item |
    item.between?( "odpt.Station:TokyoMetro.Chiyoda.Ayase" , "odpt.Station:TokyoMetro.Chiyoda.KitaAyase" )
  }

  describe ::TokyoMetro::Api::RailwayLine::List , "after add Chiyoda Branch Line" do

    describe ::TokyoMetro::Api::RailwayLine::Info , "of Chiyoda Main Line (Yoyogi-uehara - Ayase)" do

      describe "station_order" do
        # 北綾瀬は含まれない
        it "does not exist" do
          expect( chiyoda_line_station_order_kita_ayase ).to be_blank
        end
      end

      describe "travel_time" do
        #綾瀬・北綾瀬間の情報は含まれない
        it "does not exist" do
          expect( chiyoda_line_travel_time_between_ayase_and_kita_ayase ).to be_blank
        end
      end

    end

    describe ::TokyoMetro::Api::RailwayLine::Info , "of Chiyoda Branch Line (Ayase - Kita-ayase)" do

      it "is present" do
        expect( chiyoda_branch_line ).to be_present
      end

      station_order = chiyoda_branch_line.station_order
      travel_time = chiyoda_branch_line.travel_time

      # station_order の長さは 2
      it "has two stations" do
        expect( station_order.length ).to eq(2)
      end

      describe "station_order" do

        # 最初の要素は "odpt.Station:TokyoMetro.ChiyodaBranch.Ayase" (index: 0)
        it "begins with Ayase" do
          expect( station_order[0].station ).to eq( "odpt.Station:TokyoMetro.ChiyodaBranch.Ayase" )
          expect( station_order[0].index ).to eq(0)
        end

        # 次の要素は "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase" (index: 1)
        it "end at Kita-ayase" do
          expect( station_order[1].station ).to eq( "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase" )
          expect( station_order[1].index ).to eq(1)
        end
      end

      describe "travel_time" do
        it "has two stations" do
          expect( travel_time.length ).to eq( ( station_order.length - 1 ) * 2 )
        end
      end

    end

  end

end
