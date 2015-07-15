class TokyoMetro::Factory::Convert::Patch::Api::TrainLocation::ChiyodaMainLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    convert_invalid_station_name_of_chiyoda_main_line_train
  end

  private

  def convert_invalid_station_name_of_chiyoda_main_line_train
    if object.chiyoda_line?
      if starting_on_yoyogi_uehara_side? and invalid_chiyoda_main_line_train_terminating_at_kita_ayase?

        if object.limited_express_or_romance_car?
          set_terminal_station_nil
        else
          set_terminal_station_ayase
        end

        set_direction_for_ayase
      end

    elsif invalid_chiyoda_main_line_train_terminating_at_invalid_seijo_gakuen_mae?
      set_terminal_station_nil
    end

  end

  def invalid_chiyoda_main_line_train_terminating_at_kita_ayase?
     object.terminating_at_kita_ayase_on_chiyoda_main_line?
  end

  def invalid_chiyoda_main_line_train_terminating_at_invalid_seijo_gakuen_mae?
    object.terminal_station == "odpt.Station:TokyoMetro.Chiyoda成城学園前"
  end

  def starting_on_yoyogi_uehara_side?
    object.starting_at_yoyogi_uehara? or object.starting_on_odakyu_line? or object.starting_on_hakone_tozan_line?
  end

  def set_terminal_station_ayase
    regexp = /(?<=TokyoMetro\.Chiyoda\.)Kita(?=Ayase)/
    puts "=" * 4 + " " + "invalid_chiyoda_main_line_train_terminating_at_kita_ayase"
    puts object.id_urn
    puts object.same_as
    object.instance_variable_set( :@terminal_station , object.terminal_station.gsub( regexp , "" ) )
  end

  def set_terminal_station_nil
    object.instance_variable_set( :@terminal_station , nil )
  end

  def set_direction_for_ayase
    object.instance_variable_set( :@railway_direction , "odpt.Station:TokyoMetro.Chiyoda.Ayase" )
  end

end
