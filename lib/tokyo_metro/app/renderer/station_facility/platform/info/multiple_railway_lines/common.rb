module TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::Common

  attr_reader :railway_lines

  def railway_line_info
    @railway_line_infos
  end

  private

  def set_railway_line_info( railway_line_infos )
    @railway_line_infos = railway_line_infos
  end

end
