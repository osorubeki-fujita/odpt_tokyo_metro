#-------- odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4 / odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5（エスカレーターの利用可能日）
def escalator_operation_day_in_kasumigaseki
  c_escalator_4 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4"
  c_escalator_5 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5"

  [ c_escalator_4 , c_escalator_5 ].each do | escalator_name |
    proc_for_searching = ::Proc.new { | barrier_free_info | barrier_free_info.same_as == escalator_name }

    barrier_free_info = ::TokyoMetro::Api.station_facilities.find { | info | info.barrier_free_facilities.any?( &proc_for_searching ) }.barrier_free_facilities.find( &proc_for_searching )

    describe TokyoMetro::Api::StationFacility::Info , "after processing invalid info \"#{ escalator_name }\"" do
      describe TokyoMetro::Api::StationFacility::Info::BarrierFree::Facility::Escalator::Info do
        it "has 3 ServiceDetail infos" do
          expect( barrier_free_info.service_detail_infos.length ).to eq(3)
        end

        service_detail_1 = barrier_free_info.service_detail_infos[0]
        service_detail_2 = barrier_free_info.service_detail_infos[1]
        service_detail_3 = barrier_free_info.service_detail_infos[2]

        it "is operated only to upper side until 20:00 on weekdays." do
          expect( service_detail_1.operation_day ).to eq( "平日" )
          expect( service_detail_1.service_start_time ).to eq( "始発" )
          expect( service_detail_1.service_end_time ).to eq( "20:00" )
          expect( service_detail_1.direction ).to be_up
          expect( service_detail_1.direction ).not_to be_down
        end

        it "is operated only to supper side from 20:00 on weekdays." do
          expect( service_detail_2.operation_day ).to eq( "平日" )
          expect( service_detail_2.service_start_time ).to eq( "20:00" )
          expect( service_detail_2.service_end_time ).to eq( "終車時" )
          expect( service_detail_2.direction ).to be_down
          expect( service_detail_2.direction ).not_to be_up
        end

        it "is operated only to upper side on saturdays and holidays." do
          expect( service_detail_3.operation_day ).to eq( "土休日" )
          expect( service_detail_3.service_start_time ).to eq( "始発" )
          expect( service_detail_3.service_end_time ).to eq( "終車時" )
          expect( service_detail_3.direction ).to be_up
          expect( service_detail_3.direction ).not_to be_down
        end

      end

    end
  end

end
