class TokyoMetro::Api::StationTimetable::Info::Fundamental::Info

  include ::TokyoMetro::ClassNameLibrary::Api::StationTimetable
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info

  include ::TokyoMetro::Modules::Fundamental::Api::Common::NotRealTime

  # Constructor
  def initialize( stations , railway_line_infos , operators , railway_directions )
    @stations = stations
    @railway_line_infos = railway_line_infos
    @operators = operators
    @railway_directions = railway_directions
  end

  # 駅 - odpt:Station
  # @return [String]
  attr_reader :stations

  # 路線 - odpt:Railway
  # @return [String]
  attr_reader :railway_line_infos

  # 運行会社 - odpt:Operator
  # @return [String]
  attr_reader :operators

  # 方面 - odpt:RailDirection
  # @return [String]
  attr_reader :railway_directions

  def to_separated_list
    ary = self.class.fundamental_info_separeted_list.new

    @stations.each do | station |
      @railway_line_infos.each do | railway_line_info |
        @operators.each do | operator |
          @railway_directions.each do | railway_direction |

            ary << self.class.fundamental_info_separeted_info.new( station , railway_line_info , operator , railway_direction )

          end
        end
      end
    end

    ary
  end

  def seed( *args )
    self.to_separated_list.seed( *args )
  end

  def self.factory_for_this_class
    factory_for_generating_fundamental_info_from_hash
  end

end
