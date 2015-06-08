class TokyoMetro::App::Renderer::WomenOnlyCarInfo::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request )
    super(
      request ,
      :title ,
      :temp ,
      "女性専用車のご案内" ,
      "Women only car" ,
      icon_size: 3
    )
  end

end
