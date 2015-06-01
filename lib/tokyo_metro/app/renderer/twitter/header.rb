class TokyoMetro::App::Renderer::Twitter::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  include ::TokyoMetro::App::Renderer::Concerns::Header::Content::SizeChangingButtonType

  def initialize( request , visibility , icon_size: 2 )
    @visibility = visibility
    super(
      request ,
      :twitter_header ,
      :twitter_square ,
      "" ,
      "Twitter" ,
      icon_size: icon_size ,
      size_changing_button_type: size_changing_button_type ,
      size_changing_button_id: :twitter_button ,
      add_update_button: false ,
      update_button_id: nil ,
      additional_content: nil
    )
  end

end
