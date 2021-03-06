def platform_transfer_infos_at_nakano_sakaue
  p_infos = ::TokyoMetro::Api.station_facilities.find { | item |
    item.same_as == "odpt.StationFacility:TokyoMetro.NakanoSakaue"
  }.try( :platform_infos )

  raise unless p_infos.present?

  railway_line_infos = {
    main: "odpt.Railway:TokyoMetro.Marunouchi" ,
    branch: "odpt.Railway:TokyoMetro.MarunouchiBranch"
  }

  oedo = "odpt.Railway:Toei.Oedo"

  for_honancho = "odpt.RailDirection:TokyoMetro.Honancho"

  describe TokyoMetro::Api::StationFacility::Info::Platform::Info , "after converting railway direction in platform transfer info at Nakano-sakaue" do
    it "has platform transfer info for Honancho." do
      p_infos.each do | platform_info |

        if platform_info.railway_line == railway_line_infos[ :main ] and platform_info.car_composition == 6
          t_infos = platform_info.transfer_infos
          if t_infos.present?
            t_infos.each do | transfer_info |
              if transfer_info.railway_line != oedo and transfer_info.railway_direction == for_honancho
                expect( transfer_info.railway_line ).to eq( railway_line_infos[ :branch ] )
              end
            end
          end
        end

      end
    end
  end

end
