class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::MarunouchiLine < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::MultipleRailwayLines

  private

  def set_railway_line_infos( railway_line_infos )
    @main_railway_line_info = railway_line_infos.find( &:marunouchi_line? )
    @branch_railway_line_info = railway_line_infos.find( &:marunouchi_branch_line? )
  end

  def railway_line_info_base
    @main_railway_line_info
  end

  def set_number_of_columns_next_to_railway_line
    @columns_next_to_railway_line = 9
  end

end
