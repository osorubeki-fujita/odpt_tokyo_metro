require 'spec_helper'

describe TokyoMetro do
  it 'has a version number' do
    expect(TokyoMetro::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end

open( "#{ ::File.dirname( __FILE__ ) }/../../required_files.txt" , "r:utf-8" ).read.split( /\n/ ).each do |f|
  require "#{ ::File.dirname( __FILE__ ) }/../../#{f}"
end

#---------------- 標準添付ライブラリの拡張
::TokyoMetro.extend_builtin_libraries

#---------------- モジュールの組み込み
::TokyoMetro.set_modules

#---------------- 定数のセット
::TokyoMetro.set_fundamental_constants

require_relative 'tokyo_metro_spec/fare_spec'