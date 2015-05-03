::TokyoMetro.set_api_constants( { station_facility: true } )

require_relative 'station_facility/platform_infos_of_marunouchi_branch_line.rb'
require_relative 'station_facility/platform_infos_of_chiyoda_branch_line.rb'

require_relative 'station_facility/toilet_location_in_nakano_shimbashi.rb'
require_relative 'station_facility/escalator_direction_in_otemachi.rb'

require_relative 'station_facility/replacing_railway_lines_of_platform_infos.rb'

platform_infos_of_marunouchi_branch_line
platform_infos_of_chiyoda_branch_line

station_facility_toilet_location_in_nakano_shimbashi
station_facility_escalator_direction_in_otemachi

station_facility_replacing_railway_lines_of_platform_infos