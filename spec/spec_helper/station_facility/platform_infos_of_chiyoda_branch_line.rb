def platform_infos_of_chiyoda_branch_line
  ayase = ::TokyoMetro::Api.station_facilities.find { | item | item.same_as == "odpt.StationFacility:TokyoMetro.Ayase" }
  kita_ayase = ::TokyoMetro::Api.station_facilities.find { | item | item.same_as == "odpt.StationFacility:TokyoMetro.KitaAyase" }

  [ ayase , kita_ayase ].each do | facility_info |
    describe TokyoMetro::Api::StationFacility::Info::Platform::Info , "after converting railway line name \"odpt.Railway:TokyoMetro.ChiyodaBranch\"" do
      it "\'#{ facility_info.same_as }\' contains infos about trains of 3 cars on Chiyoda Branch Line (TokyoMetro::Api::StationFacility::Info::Platform::Info::Transfer::Info)" do

        facility_info.platform_infos.each do | platform_info |
          if platform_info.car_composition == 3
            expect( platform_info.railway_line ).to eq( "odpt.Railway:TokyoMetro.ChiyodaBranch" )
            expect( platform_info.railway_line ).not_to eq( "odpt.Railway:TokyoMetro.Chiyoda" )
          end
        end

      end
    end
  end

  describe TokyoMetro::Api::StationFacility::Info do
    it "\'#{ ayase.same_as }\' contains infos about trains of 10 cars on Chiyoda Main Line (TokyoMetro::Api::StationFacility::Info::Platform::Info::Transfer::Info)" do

      ayase.platform_infos.each do | platform_info |

        if platform_info.car_composition == 10
          if platform_info.transfer_infos.present?

            platform_info.transfer_infos.each do | transfer_info |
              if transfer_info.railway_direction == "odpt.RailDirection:TokyoMetro.KitaAyase"
                expect( transfer_info.railway_line ).to eq( "odpt.Railway:TokyoMetro.ChiyodaBranch" )
              end
            end

          end
        end

      end

    end
  end

end
