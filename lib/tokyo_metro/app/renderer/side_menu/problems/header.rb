class TokyoMetro::App::Renderer::SideMenu::Problems::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request , icon_size: 2 )
    super(
      request ,
      :problems ,
      :info ,
      "既知の主な問題点" ,
      "Problems and bugs" ,
      icon_size: icon_size ,
      size_changing_button_type: nil ,
      size_changing_button_id: nil ,
      add_update_button: false ,
      update_button_id: nil ,
      additional_content: nil
    )
  end

end
