class TokyoMetro::App::Renderer::StationFacility::Header::PlatformInfo < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :platform_info ,
      "乗車・降車位置のご案内" ,
      "Information of transfer, barrier free facilities, surrounding areas on the platforms" ,
      icon_size: 3
    )
  end

end
