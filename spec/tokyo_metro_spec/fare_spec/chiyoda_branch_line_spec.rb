def fares_related_to_chiyoda_branch_line
  from_kita_ayase = ::TokyoMetro::Api.fares.select { | item | item.from?( /KitaAyase\Z/ ) }
  to_kita_ayase = ::TokyoMetro::Api.fares.select { | item | item.to?( /KitaAyase\Z/ ) }

  from_ayase = ::TokyoMetro::Api.fares.select { | item | item.from?( /Chiyoda\.Ayase\Z/ ) }
  to_ayase = ::TokyoMetro::Api.fares.select { | item | item.to?( /Chiyoda\.Ayase\Z/ ) }

  kita_ayase_set = [
    [ from_kita_ayase , :from_station ] , # 北綾瀬から
    [ to_kita_ayase , :to_station ] # 北綾瀬へ
  ]

  ayase_set = [
    [ from_ayase , :from_station ] , # 綾瀬から
    [ to_ayase , :to_station ] # 綾瀬へ
  ]

  describe ::TokyoMetro::Api::Fare::Info , "after converting station name of Kita-ayase" do
    kita_ayase_set.each do | ary , method_name |
      prep = method_name.to_s.gsub( /_station\Z/ , "" )
      it "is #{ prep } \'odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase\' on Chiyoda Branch Line." do
        ary.each do | item |
          expect( item.send( method_name ) ).to eq( "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase" )
          expect( item.same_as ).to match( /ChiyodaBranch\.KitaAyase/ )

          expect( item.send( method_name ) ).not_to match( /Chiyoda\.KitaAyase\Z/ )
          expect( item.same_as ).not_to match( /Chiyoda\.KitaAyase/ )
        end
      end
    end
  end

  describe ::TokyoMetro::Api::Fare::Info , "after adding infos related to Ayase on Chiyoda Branch Line" do

    ayase_set.each do | ary , method_name |
      prep = method_name.to_s.gsub( /_station\Z/ , "" )

      it "is #{ prep } \'odpt.Station:TokyoMetro.Chiyoda.Ayase\' on Chiyoda Line" do
        ary.each do | item |
          expect( item.send( method_name ) ).to eq( "odpt.Station:TokyoMetro.Chiyoda.Ayase" )
          expect( item.same_as ).to match( /Chiyoda\.Ayase/ )
        end
      end

    end

    ayase_set.each do | ary , method_name |
      prep = method_name.to_s.gsub( /_station\Z/ , "" )
      it "is #{ prep } \'odpt.Station:TokyoMetro.ChiyodaBranch.Ayase\' on Chiyoda Branch Line" do
        ary.each do | item |
          station_name_for_chiyoda_branch = item.send( method_name ).gsub( /Chiyoda(?=\.Ayase)/ , "ChiyodaBranch" )
          same_as_for_chiyoda_branch = item.same_as.gsub( /Chiyoda(?=\.Ayase)/ , "ChiyodaBranch" )
          fare_of_ayase_branch = ::TokyoMetro::Api.fares.find { | item | item.same_as == same_as_for_chiyoda_branch }

          expect( fare_of_ayase_branch ).to be_present
          expect( fare_of_ayase_branch.send( method_name ) ).to eq( station_name_for_chiyoda_branch )
        end
      end

    end

  end

end