require 'spec_helper'
require 'deplo'

TokyoMetro.set_rails_consts( "C:/RubyPj/rails/tokyo_metro" )

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.17"

describe TokyoMetro do
  it "has a version number \'#{ version }\'" do
    expect( ::TokyoMetro::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::TokyoMetro::VERSION , spec_filename ) ).to eq( true )
  end
end

#---------------- モジュールの組み込み
::TokyoMetro.set_modules

#---------------- 定数のセット
::TokyoMetro.set_fundamental_constants

#--------------------------------

#require_relative 'tokyo_metro_spec/dictionary.rb'
#require_relative 'tokyo_metro_spec/static.rb'

# require_relative 'tokyo_metro_spec/fare.rb'
require_relative 'tokyo_metro_spec/railway_line.rb'
require_relative 'tokyo_metro_spec/station_facility.rb'
require_relative 'tokyo_metro_spec/station.rb'