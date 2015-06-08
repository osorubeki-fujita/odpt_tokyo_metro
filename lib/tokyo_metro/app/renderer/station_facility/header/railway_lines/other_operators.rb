class TokyoMetro::App::Renderer::StationFacility::Header::RailwayLines::OtherOperators < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :normal_train ,
      "乗り入れ路線" ,
      "Other railway lines" ,
      icon_size: 2
    )
  end

end
