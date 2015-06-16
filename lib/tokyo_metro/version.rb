module TokyoMetro
  VERSION = ::File.open( "#{ ::File.dirname( __FILE__ ) }/../../.current_version" , "r:utf-8" ).read.chomp
end
