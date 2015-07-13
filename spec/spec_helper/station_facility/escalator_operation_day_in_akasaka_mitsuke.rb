#-------- odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1（エスカレーターの方向）
def escalator_operation_day_in_akasaka_mitsuke
  g_escalator_1 = "odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1"

  [ g_escalator_1 ].each do | escalator_name |
    proc_for_searching = ::Proc.new { | barrier_free_info | barrier_free_info.same_as == escalator_name }

    barrier_free_info = ::TokyoMetro::Api.station_facilities.find { | info | info.barrier_free_facilities.any?( &proc_for_searching ) }.barrier_free_facilities.find( &proc_for_searching )

    describe TokyoMetro::Api::StationFacility::Info , "after processing invalid info \"#{ escalator_name }\"" do
      describe TokyoMetro::Api::StationFacility::Info::BarrierFree::Facility::Escalator::Info do
        it "has 4 ServiceDetail infos" do
          expect( barrier_free_info.service_detail_infos.length ).to eq(4)
        end

        service_detail_1 = barrier_free_info.service_detail_infos[0]
        service_detail_2 = barrier_free_info.service_detail_infos[1]
        service_detail_3 = barrier_free_info.service_detail_infos[2]
        service_detail_4 = barrier_free_info.service_detail_infos[3]

        it "is operated to both side on saturdays and holidays." do
          expect( service_detail_1.operation_day ).to eq( "土日祝" )
          expect( service_detail_1.service_start_time ).to eq( "始発" )
          expect( service_detail_1.service_end_time ).to eq( "終車時" )
          expect( service_detail_1.direction ).to be_up
          expect( service_detail_1.direction ).to be_down
        end

        it "is operated to both side until 7:30 on weekdays." do
          expect( service_detail_2.operation_day ).to eq( "平日" )
          expect( service_detail_2.service_start_time ).to eq( "始発" )
          expect( service_detail_2.service_end_time ).to eq( "7:30" )
          expect( service_detail_2.direction ).to be_up
          expect( service_detail_2.direction ).to be_down
        end

        it "is operated only to upper side from 7:30 until 10:00 on weekdays." do
          expect( service_detail_3.operation_day ).to eq( "平日" )
          expect( service_detail_3.service_start_time ).to eq( "7:30" )
          expect( service_detail_3.service_end_time ).to eq( "10:00" )
          expect( service_detail_3.direction ).to be_up
          expect( service_detail_3.direction ).not_to be_down
        end

        it "is operated to both side from 10:00 on weekdays." do
          expect( service_detail_4.operation_day ).to eq( "平日" )
          expect( service_detail_4.service_start_time ).to eq( "10:00" )
          expect( service_detail_4.service_end_time ).to eq( "終車時" )
          expect( service_detail_4.direction ).to be_up
          expect( service_detail_4.direction ).to be_down
        end

      end

    end
  end

end
