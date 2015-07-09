def platform_transfer_infos_at_kudanshita
  p_infos = ::TokyoMetro::Api.station_facilities.find { | item |
    item.same_as == "odpt.StationFacility:TokyoMetro.Kudanshita"
  }.try( :platform_infos )

  raise unless p_infos.present?

  toei_shinjuku = "odpt.Railway:Toei.Shinjuku"
  invalid_railway_direction = toei_shinjuku

  describe TokyoMetro::Api::StationFacility::Info::Platform::Info , "after converting invalid railway direction in platform transfer info at Kudanshita" do
    it "does not have railway direction name \'#{ invalid_railway_direction }\'." do
      p_infos.each do | platform_info |

        t_infos = platform_info.transfer_infos
        if t_infos.present?
          t_infos.each do | transfer_info |
            if transfer_info.railway_line == toei_shinjuku
              expect( transfer_info.railway_direction ).not_to eq( invalid_railway_direction )
            end
          end
        end

      end
    end
  end

end
