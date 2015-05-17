def platform_infos_of_marunouchi_branch_line
  facility_infos = ::TokyoMetro::Api.station_facilities.select { | item |
    [ "odpt.StationFacility:TokyoMetro.NakanoShimbashi" , "odpt.StationFacility:TokyoMetro.NakanoFujimicho" , "odpt.StationFacility:TokyoMetro.Honancho" ].include?( item.same_as )
  }

  facility_infos.each do | facility_info |

    describe TokyoMetro::Api::StationFacility::Info::Platform::Info , "after converting railway line name \"odpt.Railway:TokyoMetro.MarunouchiBranch\"" do
      it "\'#{ facility_info.same_as }\' is about trains of 3 cars on Marunouchi Branch Line" do

        facility_info.platform_infos.each do | platform_info |
          if platform_info.car_composition == 3
            expect( platform_info.railway_line ).to eq( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
            expect( platform_info.railway_line ).not_to eq( "odpt.Railway:TokyoMetro.Marunouchi" )
          end
        end

      end
    end

  end

end