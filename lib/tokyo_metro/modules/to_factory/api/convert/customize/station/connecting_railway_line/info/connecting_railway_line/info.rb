# @note
#   This module is prepended
#     to {TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info}
#     by {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine.set_modules} .
module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine::Info::ConnectingRailwayLine::Info

  include ::TokyoMetro::Modules::Decision::Common::Station::ConnectingRailwayLine
  include ::TokyoMetro::Modules::Common::Info::NewAndOldRailwayLine
  include ::TokyoMetro::Modules::Common::Info::NewAndOldRailwayLine::SetTime

  # Constructor
  def initialize( railway_line , start_on: nil , end_on: nil , index_in_station: nil , cleared: false , connecting_another_station: nil , not_recommended: false , note: nil , hidden_on_railway_line_page: false )
    # puts railway_line

    super( railway_line )
    @start_on = set_time_of( start_on , type: :start_on )
    @end_on = set_time_of( end_on , type: :end_on )

    @index_in_station = index_in_station
    @cleared = cleared

    @connecting_another_station = connecting_another_station
    @not_recommended = not_recommended
    @note = note
    @hidden_on_railway_line_page = hidden_on_railway_line_page

    @customized_infos = ::Array.new
  end

  attr_reader :start_on
  attr_reader :end_on

  attr_reader :index_in_station

  attr_reader :connecting_another_station
  attr_reader :note
  attr_reader :hidden_on_railway_line_page

  attr_reader :customized_infos

  [ :start_on , :end_on ].each do | instance_variable |
    eval <<-DEF
      def set_#{ instance_variable }( variable )
        @#{ instance_variable } = set_time_of( variable , type: :#{ instance_variable } )
        @customized_infos << :#{ instance_variable }
      end
      private :set_#{ instance_variable }
    DEF
  end

  [ :index_in_station , :connecting_another_station , :note ].each do | instance_variable |
    eval <<-DEF
      def set_#{ instance_variable }( variable )
        @#{ instance_variable } = variable
        @customized_infos << :#{ instance_variable }
      end
      private :set_#{ instance_variable }
    DEF
  end

  [ :cleared , :not_recommended , :hidden_on_railway_line_page ].each do | instance_variable |
    eval <<-DEF

      def #{instance_variable}?
        @#{instance_variable}
      end

      def #{ instance_variable }!
        @#{ instance_variable } = true
        @customized_infos << :#{ instance_variable }
      end

      def set_#{instance_variable}
        @#{instance_variable} = true
        @customized_infos << :#{ instance_variable }
      end
      private :set_#{instance_variable}

    DEF
  end

  def connecting_to_another_station?
    connecting_another_station.present?
  end

end
