class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::MarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MarunouchiBranchLine::Info

  def process
    if to_process?
      convert_railway_line_name
      convert_station_name
    end
  end

  private

  def convert_station_name
    [ :marunouchi_branch_line_stations , :nakano_sakaue ].each do | method |
      ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ReplaceStationName::Info.process(
        @object ,
        ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Dictionary::RegexpForReplace.send( method ) ,
        ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.marunouchi_branch_in_system
      )
    end
  end

end
