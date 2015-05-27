require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.3.1"

describe TokyoMetro do
  it "has a version number \'#{ version }\'" do
    expect( ::TokyoMetro::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::TokyoMetro::VERSION , spec_filename ) ).to eq( true )
  end
end

#--------

options = [ ]
# options = [ :station ]

#--------

options = options.map( &:to_s )

def to_test( category , options )
  options.nil? or ( options.present? and options.include?( category.to_s ) )
end

#--------

if to_test( :dictionary , options )
  dictionary_of_stations
end

#--------

if to_test( :static , options )
  static_stations
  static_railway_lines
  static_train_types
end

#--------

if to_test( :fare , options )
  ::TokyoMetro.set_api_constants( { fare: true } )
  fares_related_to_marunouchi_branch_line
  fares_related_to_chiyoda_branch_line
end

#--------

if to_test( :railway_line , options )
  ::TokyoMetro.set_api_constants( { railway_line: true } )
  railway_line_info_of_marunouchi_branch_line
  railway_line_info_of_chiyoda_branch_line
end

#--------

if to_test( :station_facility , options )
  ::TokyoMetro.set_api_constants( { station_facility: true } )

  platform_infos_of_marunouchi_branch_line
  platform_infos_of_chiyoda_branch_line

  station_facility_toilet_location_in_nakano_shimbashi
  station_facility_escalator_direction_in_otemachi

  station_facility_replacing_railway_lines_of_platform_infos
end

#--------

if to_test( :station , options )
  ::TokyoMetro.set_api_constants( { station: true } )

  stations_on_marunouchi_branch_line
  stations_on_chiyoda_branch_line
  connecting_railway_lines_of_station
end
