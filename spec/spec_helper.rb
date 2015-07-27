$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tokyo_metro'

time_begin = ::Time.now

# TokyoMetro.initialize_in_local_environment( "C:/RubyPj/rails/tokyo_metro" )
TokyoMetro.initialize_in_local_environment( "/Users/shufujita/RubyPj/Rails/tokyo_metro_app" )
TokyoMetro.set_gem_dev_dirs( "/Users/shufujita/rubypj/gems/tokyo_metro" , "201412" )


time_end = ::Time.now
puts "#{ ( time_end - time_begin ) } ms"

def compare_infos_in_db_and_static_infos( class_name_of_static_info , static_infos , infos_in_db , columns )

  describe class_name_of_static_info do

    static_infos.each do | static_info_name , static_info |
      data = infos_in_db.find { | item | item[0] == static_info_name }
      it "has valid infos" do
        for i in 1..( columns.length - 1 )
          s = static_info.send( columns[i] )
          in_db = data[i]
          if in_db.blank?
            expect(s).to be_blank
          else
            expect(s).to eq( in_db )
          end
        end
      end
    end

  end

end


#--------------------------------

require_relative 'spec_helper/dictionary/station.rb'

#--------

require_relative 'spec_helper/static/operator_infos.rb'
require_relative 'spec_helper/static/railway_line_infos.rb'
require_relative 'spec_helper/static/stations.rb'
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

require_relative 'spec_helper/station_facility/platform_transfer_infos_at_kudanshita.rb'
require_relative 'spec_helper/station_facility/platform_transfer_infos_at_nakano_sakaue.rb'

require_relative 'spec_helper/station_facility/toilet_location_in_nakano_shimbashi.rb'
require_relative 'spec_helper/station_facility/escalator_direction_in_otemachi.rb'
require_relative 'spec_helper/station_facility/escalator_operation_day_in_kasumigaseki.rb'
require_relative 'spec_helper/station_facility/escalator_operation_day_in_akasaka_mitsuke.rb'
require_relative 'spec_helper/station_facility/surrounding_area.rb'

require_relative 'spec_helper/station_facility/replacing_railway_line_infos_of_platform_infos.rb'

#--------

require_relative 'spec_helper/station/marunouchi_branch_line.rb'
require_relative 'spec_helper/station/chiyoda_branch_line.rb'
require_relative 'spec_helper/station/connecting_railway_line_infos.rb'

#--------

require_relative 'spec_helper/train_location.rb'

#--------

require_relative 'spec_helper/get_info_from_api.rb'
