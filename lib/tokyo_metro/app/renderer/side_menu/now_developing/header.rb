class TokyoMetro::App::Renderer::SideMenu::NowDeveloping::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request , icon_size: 2 )
    super(
      request ,
      :remark ,
      :now_developing ,
      "ご利用上の注意" ,
      "Please note" ,
      icon_size: icon_size ,
      size_changing_button_type: nil ,
      size_changing_button_id: nil ,
      add_update_button: false ,
      update_button_id: nil ,
      additional_content: nil
    )
  end

end
