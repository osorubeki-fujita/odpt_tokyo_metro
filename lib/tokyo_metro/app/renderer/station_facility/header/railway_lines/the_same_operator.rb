class TokyoMetro::App::Renderer::StationFacility::Header::RailwayLines::TheSameOperator < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :tokyo_metro ,
      "#{ ::ApplicationHelper.this_operator.name_ja_normal }の路線" ,
      "Railway lines of #{ ::ApplicationHelper.this_operator.name_en_normal }" ,
      icon_size: 3
    )
  end

end
