module TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Refinement::Info

  refine ::TokyoMetro::Api::TrainTimetable::Info do

    # 「本来は副都心線の時刻表であるが、有楽町線の時刻表に含まれてしまっている列車か否か」を判定するメソッド
    # @return [Boolean]
    # @note 運行日が休日であることに注意
    def invalid_fukutoshin_line_trains_on_yurakucho_line?
      yurakucho_line? and operated_on_weekdays? and has_invalid_train_number?
    end

    # 列車時刻表の配列から、自身に対応する副都心線の列車を取得するメソッド
    # @param ary [::TokyoMetro::Api::TrainTimetable::List]
    # @return [::TokyoMetro::Api::TrainTimetable::Info]
    def valid_fukutoshin_line_train( train_timetables )
      train_timetables.find { | train |
        train.valid_fukutoshin_line_train_info_as_for_invalid_train_in_yurakucho_line?( @train_number )
      }
    end

    def valid_fukutoshin_line_train_info_as_for_invalid_train_in_yurakucho_line?( train_number_of_invalid_train )
      fukutoshin_line? and operated_on_weekdays? and is_train_number_included_in?( train_number_of_invalid_train )
    end

    private

    def has_invalid_train_number?
      is_train_number_included_in?( ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine.invalid_trains )
    end

    def is_train_number_included_in?( *args )
      args.flatten.include?( @train_number )
    end

  end

end
