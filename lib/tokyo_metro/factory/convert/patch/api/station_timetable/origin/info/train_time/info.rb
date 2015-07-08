class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::Origin::Info::TrainTime::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  # 補足情報に始発駅情報が含まれているにも関わらず「当駅始発」となっている場合に、「当駅始発」の情報を削除する
  def process
    if to_process?
      clear_origin_info
    end
  end

  private

  def clear_origin_info
    @object.instance_variable_set( :@is_origin , false )
  end

  def to_process?
     @object.is_origin and ( has_starting_station_info_of_ayase? or has_starting_station_info_of_wakoshi? )
  end

  [ :ayase , :wakoshi ].each do | station_name |
    eval <<-DEF
      def has_starting_station_info_of_#{ station_name }?
        @object.notes.any? { | info | info.instance_of?( ::TokyoMetro::Api::StationTimetable::Info::TrainTime::Info::Note::StartingStation::#{ station_name.capitalize } ) }
      end
    DEF
  end

end
