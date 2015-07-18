def connecting_railway_line_infos_of_station
  connecting_railway_line_infos__class

  ::TokyoMetro::Api.stations.each do | station |
    if station.connecting_railway_line_infos.present?
      connecting_railway_line_infos__replacing_railway_line_infos( station )
      connecting_railway_line_infos__ignored_railway_line_infos( station )
      connecting_railway_line_infos__optional_railway_line_infos( station )
      connecting_railway_line_infos__new_and_old_railway_line_infos( station )
      connecting_railway_line_infos__index_in_stations( station )
      connecting_railway_line_infos__transfer_additional_infos( station )
    end
  end
end

def connecting_railway_line_infos__class
  describe ::TokyoMetro::Api::Station::Info , "after setting connecting railway line infos" do
    it "connecting railway line info should be an instance of ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info ." do
      ::TokyoMetro::Api.stations.each do | station |
        connecting_railway_line_infos = station.connecting_railway_line_infos
        if connecting_railway_line_infos.present?
          station.connecting_railway_line_infos.each do | connecting_railway |
            expect( connecting_railway ).to be_instance_of( ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info )
          end
        end
      end
    end
  end
end


def connecting_railway_line_infos__replacing_railway_line_infos( station )
  infos_related_to_this_station = ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.replacing_railway_line_infos[ station.same_as ]

  if infos_related_to_this_station.present?

    list_of_connecting_railway_line_infos = get_list_of_connecting_railway_line_infos( station )

    replaced_railway_line_infos = infos_related_to_this_station.map { | item | item[ "replaced_railway_line_infos"] }.flatten

    describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "after replacing railway line names (#{ station.same_as })" do

      it "is replaced." do
        replaced_railway_line_infos.each do | replaced_railway_line |
          station.connecting_railway_line_infos.each do | connecting_railway_line_info |
            expect( connecting_railway_line_info.railway_line ).not_to eq( replaced_railway_line )
          end
        end
      end

      replacing_railway_line_infos = infos_related_to_this_station.map { | item | item[ "replacing_railway_line_infos"] }.flatten

      replacing_railway_line_infos.each do | replacing_railway_line |
        it "includes \'#{ replacing_railway_line }\'" do
          expect( list_of_connecting_railway_line_infos ).to include( replacing_railway_line )
        end
      end

    end
  end
end


def connecting_railway_line_infos__ignored_railway_line_infos( station )
  info_related_to_this_station = [ :Customize , :Patch ].map { | namespace |
    eval( "::TokyoMetro::Factory::Convert::#{namespace}::Api::Station::ConnectingRailwayLine::Info.ignored_railway_line_infos" )
  }.flatten.select { | item |
    item[ "stations" ].include?( station.same_as )
  }

  if info_related_to_this_station.present?
    ignored_railway_line_infos = info_related_to_this_station.map { | item | item[ "railway_line_infos" ] }.flatten
    list_of_connecting_railway_line_infos = get_list_of_connecting_railway_line_infos( station )
    ignored_railway_line_infos.each do | ignored_railway_line |
      describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "after deleting invalid railway line names" do
        it "(#{station.same_as}) should not be connected to \"#{ignored_railway_line}\"." do
          expect( list_of_connecting_railway_line_infos ).not_to include( ignored_railway_line )
        end
      end
    end
  end

end


def connecting_railway_line_infos__optional_railway_line_infos( station )
  info_related_to_this_station = ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.optional_railway_line_infos.select { | item |
    item[ "stations" ].include?( station.same_as )
  }
  if info_related_to_this_station.present?
    optional_railway_line_infos = info_related_to_this_station.map { | item | item[ "railway_line_infos" ] }.flatten
    list_of_connecting_railway_line_infos = get_list_of_connecting_railway_line_infos( station )
    optional_railway_line_infos.each do | optional_railway_line |
      describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "after adding optional railway line" do
        it "(#{station.same_as}) should be connected to \"#{optional_railway_line}\"." do
          expect( list_of_connecting_railway_line_infos ).to include( optional_railway_line )
        end
      end
    end
  end

end


def connecting_railway_line_infos__new_and_old_railway_line_infos( station )
  info_related_to_this_station = ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.new_and_old_railway_line_infos.select { | new_railway_line_name , info |
    info[ "stations" ].include?( station.same_as )
  }

  if info_related_to_this_station.present?
    info_related_to_this_station.each do | railway_line_name , info |

      connecting_railway_line_info_of_this_line = station.connecting_railway_line_infos.find { | info | info.railway_line == railway_line_name }
      describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "after adding new railway line info" do
        it "(#{station.same_as}) should contain the information of \"#{ railway_line_name }\"." do
          expect( connecting_railway_line_info_of_this_line ).to be_present
        end
      end

      if connecting_railway_line_info_of_this_line.present?
        starting_date_from_yaml = info[ "start_on" ]
        ending_date_from_yaml = info[ "end_on" ]
        regexp_of_date = /\A(\d{4})\.(\d{2})\.(\d{2})\Z/

        [ [ starting_date_from_yaml , "start" ] , [ ending_date_from_yaml , "end" ] ].each do | date_info , str |
          if date_info.present?

            describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "#{ str }_on" do
              it "(#{ railway_line_name } in #{station.same_as}) should contain valid date info of #{ str }ing." do
                expect( date_info ).to match( regexp_of_date )
              end
            end

            if regexp_of_date =~ date_info
              date_time = ::DateTime.new( $1.to_i , $2.to_i , $3.to_i , ::TokyoMetro::DATE_CHANGING_HOUR )
              if str == "end"
                date_time = date_time.tomorrow
              end
              describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "DateTime (#{str})" do
                it "(#{ railway_line_name } in #{station.same_as}) should #{str} on #{date_info}." do
                  expect( connecting_railway_line_info_of_this_line.send( "#{str}_on" ) ).to eq( date_time )
                end
              end
            end

          end
        end

      end

    end
  end

end


def connecting_railway_line_infos__index_in_stations( station )
  info_related_to_this_station = ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.index_in_stations[ station.same_as ]
  if info_related_to_this_station.present?

    railway_line_infos_from_yaml = info_related_to_this_station.keys
    list_of_connecting_railway_line_infos = get_list_of_connecting_railway_line_infos( station )
    describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , " - index_in_station" do
      it "(connecting railway lines in \"#{station.same_as}\") should contain the same railway lines in yaml file." do
        expect( railway_line_infos_from_yaml.sort ).to eq( list_of_connecting_railway_line_infos.sort )
      end
    end

    station.connecting_railway_line_infos.each do | connecting_railway_line_info |

      valid_index = info_related_to_this_station[ connecting_railway_line_info.railway_line ][ "index_in_station" ]
      describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "- index_in_station" do
        it "(\"#{connecting_railway_line_info.railway_line}\" connected at \"#{station.same_as}\") should contain an index number \##{valid_index}." do
          expect( connecting_railway_line_info.index_in_station ).to eq( valid_index )
        end
      end

      if info_related_to_this_station[ connecting_railway_line_info.railway_line ][ "cleared" ]
        describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info , "- cleared" do
          it "(\"#{connecting_railway_line_info.railway_line}\" connected at \"#{station.same_as}\") should be cleared in HTML." do
            expect( connecting_railway_line_info ).to be_cleared
          end
        end
      end

    end

  end
end

def connecting_railway_line_infos__transfer_additional_infos( station )
  info_related_to_this_station = ::TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info.transfer_additional_infos.select { | item |
    item[ "stations" ].include?( station.same_as )
  }
  if info_related_to_this_station.present?
    transfer_additional_infos_in_this_station = get_transfer_additional_infos( info_related_to_this_station )
    station.connecting_railway_line_infos.each do | connecting_railway_line_info |

      additional_info_of_this_line = transfer_additional_infos_in_this_station[ connecting_railway_line_info.railway_line ]

      if additional_info_of_this_line.present?
        if additional_info_of_this_line[ "not_recommended" ]
          describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
            it "(transfer to \"#{connecting_railway_line_info.railway_line}\" at \"#{station.same_as}\") should not be recommend." do
              expect( connecting_railway_line_info ).not_to be_recommended
            end
          end
        end

        if additional_info_of_this_line[ "note" ]
          describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
            it "(transfer to \"#{connecting_railway_line_info.railway_line}\" at \"#{station.same_as}\") should contain note." do
              expect( connecting_railway_line_info.note ).to eq( additional_info_of_this_line[ "note" ] )
            end
          end
        end

        if additional_info_of_this_line[ "another_station" ]
          another_station = additional_info_of_this_line[ "another_station" ]
          describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
            it "(\"#{station.same_as}\") should be connected to \"#{ another_station }\" when transfer for \"#{connecting_railway_line_info.railway_line}\"." do
              expect( connecting_railway_line_info.another_station ).to eq( another_station )
            end
          end
        end

        if additional_info_of_this_line[ "hidden_on_railway_line_page" ]
          describe ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info do
            it "(\"#{station.same_as}\") is connected to \"#{connecting_railway_line_info.railway_line}\" but it is not displayed on railway line page." do
              expect( connecting_railway_line_info ).to be_hidden_on_railway_line_page
            end
          end
        end

      end

    end
  end

end


def get_list_of_connecting_railway_line_infos( station )
  station.connecting_railway_line_infos.map( &:railway_line )
end


def get_transfer_additional_infos( ary )
  h = ::Hash.new
  ary.each do | item |
    h.update( item[ "railway_line_infos" ] )
  end
  h
end
