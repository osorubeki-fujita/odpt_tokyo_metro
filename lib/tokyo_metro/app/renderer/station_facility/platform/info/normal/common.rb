module TokyoMetro::App::Renderer::StationFacility::Platform::Info::Normal::Common

  attr_reader :railway_line_info

  def railway_line_name_ja
    @railway_line_info.name_ja
  end

  def railway_line_name_en
    @railway_line_info.name_en
  end

  def railway_line_css_class
    @railway_line_info.css_class
  end

  def railway_line_info
    @railway_line_info
  end

end
