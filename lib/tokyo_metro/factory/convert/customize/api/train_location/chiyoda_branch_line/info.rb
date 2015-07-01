class TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::ChiyodaBranchLine::Info < TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::ChiyodaBranchLine::Info

  def process
    super
    convert_invalid_station_name_of_chiyoda_main_line_train
  end

  private

  def convert_invalid_station_name_of_chiyoda_main_line_train
    if invalid_chiyoda_main_line_train_terminating_at_kita_ayase?
      regexp = /(?<=TokyoMetro\.Chiyoda\.)Kita(?=Ayase)/
      puts "=" * 4 + " " + "invalid_chiyoda_main_line_train_terminating_at_kita_ayase"
      puts object.id_urn
      puts object.same_as
      object.instance_variable_set( :@terminal_station , object.terminal_station.gsub( regexp , "" ) )
    end
  end

  def invalid_chiyoda_main_line_train_terminating_at_kita_ayase?
    object.chiyoda_line? and starting_on_yoyogi_uehara_side? and object.terminating_at_kita_ayase_on_chiyoda_main_line?
  end

  def starting_on_yoyogi_uehara_side?
    object.starting_at_yoyogi_uehara? or object.starting_on_odakyu_line? or object.starting_on_hakone_tozan_line?
  end

end
