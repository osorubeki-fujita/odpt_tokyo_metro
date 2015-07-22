class TokyoMetro::App::Renderer::StationFacility::Header::RailwayLines::TheSameOperator < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :tokyo_metro ,
      "#{ ::ApplicationHelper.this_operator_info.name_ja_normal_precise }の路線" ,
      "Railway lines of #{ ::ApplicationHelper.this_operator_info.name_en_normal_precise }" ,
      icon_size: 3
    )
  end

end
