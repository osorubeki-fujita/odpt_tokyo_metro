require_relative 'fare_spec/marunouchi_branch_line.rb'
require_relative 'fare_spec/chiyoda_branch_line.rb'

::TokyoMetro.set_api_constants( { fare: true } )

marunouchi_branch_line
chiyoda_branch_line