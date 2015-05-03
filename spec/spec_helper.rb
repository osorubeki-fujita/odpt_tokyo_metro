$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tokyo_metro'

TokyoMetro.initialize_in_local_environment( "C:/RubyPj/rails/tokyo_metro" )

#--------------------------------

require_relative 'spec_helper/dictionary/station.rb'

#--------

require_relative 'spec_helper/static/stations.rb'
require_relative 'spec_helper/static/railway_lines.rb'
require_relative 'spec_helper/static/train_types.rb'

#--------

require_relative 'spec_helper/fare/marunouchi_branch_line.rb'
require_relative 'spec_helper/fare/chiyoda_branch_line.rb'

#--------

require_relative 'spec_helper/railway_line/marunouchi_branch_line.rb'
require_relative 'spec_helper/railway_line/chiyoda_branch_line.rb'

#--------

require_relative 'spec_helper/station_facility/platform_infos_of_marunouchi_branch_line.rb'
require_relative 'spec_helper/station_facility/platform_infos_of_chiyoda_branch_line.rb'

require_relative 'spec_helper/station_facility/toilet_location_in_nakano_shimbashi.rb'
require_relative 'spec_helper/station_facility/escalator_direction_in_otemachi.rb'

require_relative 'spec_helper/station_facility/replacing_railway_lines_of_platform_infos.rb'

#--------

require_relative 'spec_helper/station/marunouchi_branch_line.rb'
require_relative 'spec_helper/station/chiyoda_branch_line.rb'
require_relative 'spec_helper/station/connecting_railway_lines.rb'