require 'spec_helper'
require 'deplo'

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
