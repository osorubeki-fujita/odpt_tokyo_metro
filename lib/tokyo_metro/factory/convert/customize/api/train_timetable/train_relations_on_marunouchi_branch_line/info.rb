class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::TrainRelationsOnMarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  include ::TokyoMetro::ClassNameLibrary::Api::TrainTimetable

  def initialize( object )
    super( object )

    if @object.marunouchi_line_including_branch?
      @info_of_stations_in_dictionary = starting_and_terminal_stations_of_trains.find { | item | item[ "trains" ].include?( @object.same_as ) }
    end
  end

  def process
    if to_process?
      convert_starting_and_terminal_station_of_trains_between_nakano_fujimico_and_ogikubo
      set_previous_train
      set_following_train
    end
  end

  private

  def to_process?
    @info_of_stations_in_dictionary.present?
  end

  def starting_and_terminal_stations_of_trains
    self.class.info_class.starting_and_terminal_stations_of_marunouchi_branch_line_trains
  end

  def train_relations_of_this_train_in_dictionary
    self.class.info_class.train_relations_on_marunouchi_branch_line.find { | item | item.include?( @object.same_as ) }
  end

  # @!group Set starting and terminal station names

  def convert_starting_and_terminal_station_of_trains_between_nakano_fujimico_and_ogikubo
    # puts TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::TrainRelationsOnMarunouchiBranchLine::Info
    @object.instance_variable_set( :@starting_station , @info_of_stations_in_dictionary[ "starting_station" ] )
    @object.instance_variable_set( :@terminal_station , @info_of_stations_in_dictionary[ "terminal_station" ] )
  end

  # @!group Set train relations

  #-------- 定義されるメソッド
  #
  # set_previous_train
  # set_following_train
  #
  [
    [ :previous , :first , :departure , :starting ] ,
    [ :following , :last , :arrival , :terminal ]
  ].each do | previous_or_following , first_or_last , departure_or_arrival , starting_or_terminal |
    eval <<-DEF

      def set_#{ previous_or_following }_train
        #{ previous_or_following }_train = #{ previous_or_following }_train_in_dictionary
        if #{ previous_or_following }_train.present?
          #{ first_or_last }_station_time_of_this_train = @object.valid_list.#{ first_or_last }

          unless #{ first_or_last }_station_time_of_this_train.#{ departure_or_arrival }_station == @object.#{ starting_or_terminal}_station
            raise "Error"
          end

          list_of_#{ previous_or_following }_trains = self.class.#{ previous_or_following }_train_list_class.new( [
            self.class.#{ previous_or_following }_train_info_class.new( #{ previous_or_following }_train )
          ] )

          #{ first_or_last }_station_time_of_this_train.instance_variable_set(
            :@#{ previous_or_following }_trains ,
            list_of_#{ previous_or_following }_trains
          )
        end
      end

    DEF
  end

  #-------- 定義されるメソッド
  #
  # previous_train_in_dictionary
  # following_train_in_dictionary
  #
  [
    [ :previous , :- , 0 ] ,
    [ :following , :+ , "train_relations.length - 1" ]
  ].each do | previous_or_following , plus_or_minus , exception_of_position |
    eval <<-DEF

      def #{ previous_or_following }_train_in_dictionary
        train_relations = train_relations_of_this_train_in_dictionary

        if train_relations.present?
          index_of_this_train = train_relations.index( @object.same_as )
          unless index_of_this_train == #{ exception_of_position }
            return train_relations[ index_of_this_train #{ plus_or_minus } 1 ]
          end
        end

        return nil
      end

    DEF
  end

  # @!endgroup

end
