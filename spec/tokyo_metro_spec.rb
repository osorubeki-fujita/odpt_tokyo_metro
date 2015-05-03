require 'spec_helper'
require 'deplo'

TokyoMetro.initialize_in_local_environment( "C:/RubyPj/rails/tokyo_metro" )

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.17"

describe TokyoMetro do
  it "has a version number \'#{ version }\'" do
    expect( ::TokyoMetro::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::TokyoMetro::VERSION , spec_filename ) ).to eq( true )
  end
end

#--------------------------------

#require_relative 'tokyo_metro_spec/dictionary_spec.rb'
#require_relative 'tokyo_metro_spec/static_spec.rb'

# require_relative 'tokyo_metro_spec/fare_spec.rb'
require_relative 'tokyo_metro_spec/railway_line_spec.rb'
require_relative 'tokyo_metro_spec/station_facility_spec.rb'
require_relative 'tokyo_metro_spec/station_spec.rb'
