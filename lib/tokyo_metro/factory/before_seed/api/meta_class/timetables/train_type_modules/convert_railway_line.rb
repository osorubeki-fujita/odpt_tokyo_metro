module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::ConvertRailwayLine

  private

  def convert_railway_instance_to_yurakucho_line
    @railway_line_info_in_db = ::Railway::Line::Info.find_by_same_as( "odpt.Railway:TokyoMetro.Yurakucho" )
  end

  def convert_railway_instance_to_fukutoshin_line
    @railway_line_info_in_db = ::Railway::Line::Info.find_by_same_as( "odpt.Railway:TokyoMetro.Fukutoshin" )
  end

end
