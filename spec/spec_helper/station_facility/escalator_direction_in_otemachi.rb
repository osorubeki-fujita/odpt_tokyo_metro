#-------- odpt.StationFacility:TokyoMetro.Chiyoda.Otemachi.Outside.Escalator.1（エスカレーターの方向）
def station_facility_escalator_direction_in_otemachi
  invalid_barrier_free_info_name = "odpt.StationFacility:TokyoMetro.Chiyoda.Otemachi.Outside.Escalator.1"
  proc_for_searching = ::Proc.new { | barrier_free_info | barrier_free_info.same_as == invalid_barrier_free_info_name }

  barrier_free_info = ::TokyoMetro::Api.station_facilities.find { | info | info.barrier_free_facilities.any?( &proc_for_searching ) }.barrier_free_facilities.find( &proc_for_searching )

  describe TokyoMetro::Api::StationFacility::Info , "after processing invalid info \"#{ invalid_barrier_free_info_name }\"" do
    describe TokyoMetro::Api::StationFacility::Info::BarrierFree::Facility::Escalator::Info do
      it "has one ServiceDetail" do
        expect( barrier_free_info.service_detail_infos.length ).to eq(1)
      end

      service_detail = barrier_free_info.service_detail_infos.first

      it "is operated only to upper side." do
        expect( service_detail.direction ).to be_up
        expect( service_detail.direction ).not_to be_down
      end

    end

  end

end