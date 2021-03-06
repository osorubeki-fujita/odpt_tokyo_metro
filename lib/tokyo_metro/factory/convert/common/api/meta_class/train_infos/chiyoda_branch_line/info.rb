class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::ChiyodaBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    convert_railway_line_name_of_chiyoda_branch_line_train
  end

  private

  def convert_railway_line_name_of_chiyoda_branch_line_train
    if object.operated_only_on_chiyoda_branch_line_including_invalid?
      regexp_for_replace = ::TokyoMetro::Factory::Convert::Dictionary::RegexpForReplace.chiyoda_branch_line_stations

      object.instance_variable_set( :@railway_line , "odpt.Railway:TokyoMetro.ChiyodaBranch" )
      object.instance_variable_set( :@starting_station , object.starting_station.gsub( regexp_for_replace , "ChiyodaBranch" ) )
      object.instance_variable_set( :@terminal_station , object.terminal_station.gsub( regexp_for_replace , "ChiyodaBranch" ) )
    end
  end

end
