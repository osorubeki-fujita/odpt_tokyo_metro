def station_facility_replacing_railway_line_infos_of_platform_infos
  list_of_replacing_railway_line_infos = ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos.replacing_railway_line_infos
  describe ::TokyoMetro::Api::StationFacility::Info::Platform::Info::Transfer::Info , "after converting railway line name" do

    ::TokyoMetro::Api.station_facilities.each do | station_facility_info |
      # この駅に関係する情報のみを取得
      replacing_railway_line_infos_of_this_station = list_of_replacing_railway_line_infos[ station_facility_info.same_as ]

      if replacing_railway_line_infos_of_this_station.present?
        replaced_railway_line_infos = replacing_railway_line_infos_of_this_station.map { | item | item[ "replaced_railway_line_infos" ] }.flatten
        station_facility_info.platform_infos.each do | platform_info |
          if platform_info.transfer_infos.present?

            platform_info.transfer_infos.each do | transfer_info |
              # puts replacing_railway_line_infos_of_this_station
              replaced_railway_line_infos.each do | invalid_railway_line_name |

                it "is not \"#{invalid_railway_line_name}\" (at \"#{ station_facility_info.same_as }\")" do
                  expect( transfer_info.railway_line ).not_to eq( invalid_railway_line_name )
                end

              end
            end

          end
        end
      end

    end

  end
end
