class TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ValidStationTimesOnWeekdays::Info

  include TokyoMetro::ClassNameLibrary::Api::TrainTimetable

  # @params invalid_train 有楽町線
  # @params valid_train 副都心線
  def initialize( invalid_train , valid_train )
    @invalid_train = invalid_train
    @valid_train = valid_train
    set_direction
  end

  def to_a
    ary = ::Array.new
    case @direction
    when :a
      departure_time_between_wakoshi_and_hikawadai = self.class.station_time_list_class.new( @invalid_train.weekdays[ 0..(-2) ] )
      departure_time_between_senkawa_and_shibuya = self.class.station_time_list_class.new( @valid_train.weekdays[ 1..(-1) ] )

      ary += ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ConvertStationName::Info::StationTime::List.updated( departure_time_between_wakoshi_and_hikawadai )
      ary << station_time_of_kotake_mukaihara
      ary += departure_time_between_senkawa_and_shibuya

    when :b
      departure_time_between_shibuya_and_senkawa = self.class.station_time_list_class.new( @valid_train.weekdays[ 0..(-2) ] )
      departure_time_between_hikawadai_and_wakoshi = self.class.station_time_list_class.new( @invalid_train.weekdays[ 1..(-1) ] )

      ary += departure_time_between_shibuya_and_senkawa
      ary << station_time_of_kotake_mukaihara
      ary += ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::InternalFactory::ConvertStationName::Info::StationTime::List.updated( departure_time_between_hikawadai_and_wakoshi )
    end
    self.class.station_time_list_class.new( ary )
  end

  def self.get_by( invalid_train , valid_train )
    self.new( invalid_train , valid_train ).to_a
  end

  private

  def set_direction
    if @invalid_train.direction_a? and ( @invalid_train.terminating_on_fukutoshin_line? or @invalid_train.terminating_on_tokyu_toyoko_line? or @invalid_train.terminating_on_minatomirai_line? )
      @direction = :a
    elsif @invalid_train.direction_b? and ( @invalid_train.terminating_at_wakoshi? or @invalid_train.terminating_on_tobu_tojo_line? )
      @direction = :b
    else
      message_ary = ::Array.new
      message_ary << ""
      message_ary << "Error: The terminal station of the invalid train should be Wakoshi or"
      message_ary << "on Tobu Tojo Line, Fukutoshin Line, Tokyu Toyoko Line or Minatomirai Line."
      message_ary << "\"#{ @invalid_train.terminal_station }\" is not valid."
      raise message_ary.join( "\n" )
    end
  end

  def station_time_of_kotake_mukaihara
    station_name = ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.kotake_mukaihara_on_fukutoshin_line

    arrival_t = arrival_time_of_kotake_mukaihara.arrival_time
    departure_t = departure_time_of_kotake_mukaihara.departure_time

    self.class.station_time_info_class.new( arrival_t , station_name , departure_t , station_name )
  end

  def arrival_time_of_kotake_mukaihara
    case @direction
    when :a
      @invalid_train.weekdays.last
    when :b
      @valid_train.weekdays.last
    end
  end

  def departure_time_of_kotake_mukaihara
    case @direction
    when :a
      @valid_train.weekdays.first
    when :b
      @invalid_train.weekdays.first
    end
  end

end
