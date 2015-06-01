#-------- 駅周辺の名所・施設
# @note 誤：虎ノ門病院
# @note 正：虎の門病院
def station_facility_surrounding_area
  dict = TokyoMetro::Modules::Api::Convert::Patches::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea::DICTIONARY

  platform_info_containing_invalid_surrounding_area = ::TokyoMetro::Api.station_facilities.map( &:platform_infos ).flatten.select { | info |
    dict.keys.include?( info.surrounding_area.area_name )
  }

  platform_info_containing_valid_surrounding_area = ::TokyoMetro::Api.station_facilities.map( &:platform_infos ).flatten.select { | info |
    dict.values.include?( info.surrounding_area.area_name )
  }

  describe ::TokyoMetro::Api::StationFacility::List , "after processing invalid surrounding area" do
    describe ::TokyoMetro::Api::StationFacility::Info do
      describe ::TokyoMetro::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info do
        it "is replaced by valid surrounding area name." do

          expect( platform_info_containing_invalid_surrounding_area ).not_to be_present
          expect( platform_info_containing_valid_surrounding_area ).to be_present

        end
      end
    end
  end

end
