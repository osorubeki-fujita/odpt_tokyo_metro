class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ChiyodaBranchLine::Info < TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::ChiyodaBranchLine::Info

  def process
    super
    convert_station_name_of_chiyoda_branch_line
  end

  private

  def convert_station_name_of_chiyoda_branch_line
    if object.operated_only_on_chiyoda_branch_line_including_invalid?
      ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info.process(
        object ,
        ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Dictionary::RegexpForReplace.chiyoda_branch_line_stations ,
        "ChiyodaBranch"
      )
    end
  end

end
