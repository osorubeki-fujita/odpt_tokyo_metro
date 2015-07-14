# @note {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::TrainRelationsOnMarunouchiBranchLine#.set_modules} により {::TokyoMetro::Api::TrainTimetable::Info} へ prepend される。
module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::TrainRelationsOnMarunouchiBranchLine::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::TrainRelationsOnMarunouchiBranchLine::Info.process( self )
  end

  # @!group Instance Methods

  #-------- 定義されるメソッド
  #
  # has_previous_trains?
  # has_following_trains?
  # has_train_relations?
  #
  [ :has_previous_trains? , :has_following_trains? , :has_train_relations? ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        valid_list.send( method_name )
      end
    DEF
  end

  #-------- 定義されるメソッド
  #
  # previous_train_list
  # following_train_list
  # previous_trains_in_api
  # following_trains_in_api
  #
  [ :previous_trains , :following_trains ].each do | method_base_name |
    [ "#{ method_base_name.to_s.singularize }_list" , "#{ method_base_name }_in_api" ].each do | method_name |
      eval <<-DEF

        def #{ method_name }
          valid_list.send( method_name )
        end

      DEF
    end
  end

  #-------- 定義されるメソッド
  #
  # actual_starting_stations
  # actual_terminal_stations
  #
  [ :starting_station , :terminal_station ].each do | method_base_name |
    defined_method_name = "actual_#{ method_base_name }s"
    eval <<-DEF

      def #{ defined_method_name }
        ary = valid_list.#{ defined_method_name }
        if ary.present?
          ary
        else
          [ @#{ method_base_name } ]
        end
      end

    DEF
  end

  # @!group Seed Train Relations

  # @note 東京メトロ Open Data では、データ構造上使用しない。
  def seed_train_relations( *args )
    self.valid_list.send( __method__ , *args )
  end

  # @!endgroup

end
