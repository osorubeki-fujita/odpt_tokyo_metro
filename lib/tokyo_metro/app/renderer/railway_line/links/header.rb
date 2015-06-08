class TokyoMetro::App::Renderer::RailwayLine::Links::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request , railway_lines )
    super(
      request ,
      :title ,
      :railway_line ,
      "この路線に関するご案内" ,
      "Other pages related to this railway line" ,
      icon_size: 3
    )
  end

end
