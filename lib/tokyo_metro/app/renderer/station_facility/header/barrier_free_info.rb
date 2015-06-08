class TokyoMetro::App::Renderer::StationFacility::Header::BarrierFreeInfo < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :barrier_free_facilities ,
      "駅施設のご案内" ,
      "Information of station facilities" ,
      icon_size: 3
    )
  end

end
