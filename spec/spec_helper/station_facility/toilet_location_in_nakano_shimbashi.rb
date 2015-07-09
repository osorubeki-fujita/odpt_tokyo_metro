#-------- 中野新橋駅 トイレ設置場所
# @note 誤：odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Outside.Toilet.1
# @note 正：odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Inside.Toilet.1
def station_facility_toilet_location_in_nakano_shimbashi

  invalid_barrier_free_info_name = "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Outside.Toilet.1"
  valid_barrier_free_info_name = "odpt.StationFacility:TokyoMetro.Marunouchi.NakanoShimbashi.Inside.Toilet.1"

  proc_for_searching_barrier_free_facility = ::Proc.new { | barrier_free_info |
    barrier_free_info.same_as == valid_barrier_free_info_name
  }

  station_facility_info = ::TokyoMetro::Api.station_facilities.find { | info |
    info.barrier_free_facilities.any?( &proc_for_searching_barrier_free_facility )
  }

  barrier_free_info = station_facility_info.barrier_free_facilities.find( &proc_for_searching_barrier_free_facility )

  #--------

  valid_platform_infos = station_facility_info.platform_infos.select { | info |
    info.barrier_free_facilities.present? and info.barrier_free_facilities.any?{ | facility | facility.same_as == valid_barrier_free_info_name }
  }

  invalid_platform_infos = station_facility_info.platform_infos.select { | info |
    info.barrier_free_facilities.present? and info.barrier_free_facilities.any?{ | facility | facility.same_as == invalid_barrier_free_info_name }
  }

  describe ::TokyoMetro::Api::StationFacility::List , "after processing invalid info \"#{ invalid_barrier_free_info_name }\"" do
    describe ::TokyoMetro::Api::StationFacility::Info do
      it "\'#{ valid_barrier_free_info_name }\' is located in outside area." do
        expect( barrier_free_info ).to be_present
        expect( barrier_free_info ).not_to be_outside
        expect( barrier_free_info ).to be_inside
      end

      describe ::TokyoMetro::Api::StationFacility::Info::Platform::Info::BarrierFree::Info do
        it "\'#{ valid_barrier_free_info_name }\' is located in outside area" do
          expect( valid_platform_infos ).to be_present
          expect( invalid_platform_infos ).to be_blank
        end
      end
    end
  end

end
