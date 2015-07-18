class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::MultipleRailwayLines

  private

  def set_railway_line_infos( railway_line_infos )
    @main_railway_line_info = railway_line_infos.find( &:chiyoda_line? )
    @branch_railway_line_info = railway_line_infos.find( &:chiyoda_branch_line? )
  end

  def railway_line_base
    @main_railway_line_info
  end

  def additional_info_top
    ::Proc.new {
      ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Top.new( @request , @left_columns , @columns_next_to_railway_line , @right_columns ).render
    }
  end

  def additional_info_bottom
    ::Proc.new {
      ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Bottom.new( @request , @left_columns , @columns_next_to_railway_line , @right_columns , @branch_railway_line_info ).render
    }
  end

  def set_number_of_columns_next_to_railway_line
    @columns_next_to_railway_line = 1
  end

  def set_number_of_right_columns
    @right_columns = 5
  end

end
