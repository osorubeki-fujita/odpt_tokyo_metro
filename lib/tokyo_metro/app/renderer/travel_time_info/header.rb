class TokyoMetro::App::Renderer::TravelTimeInfo::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :clock ,
      "停車駅と所要時間のご案内" ,
      "Stops and travel time" ,
      icon_size: 3
    )
  end

end
