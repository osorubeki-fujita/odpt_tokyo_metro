class TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  include ::TokyoMetro::App::Renderer::Concerns::Header::Content::SizeChangingButtonType

  def initialize( request , visibility , icon_size: 2 )
    @visibility = visibility
    super(
      request ,
      :real_time_infos ,
      :real_time_infos ,
      "現在表示中のリアルタイム情報" ,
      "About real-time informations" ,
      icon_size: icon_size ,
      size_changing_button_type: size_changing_button_type ,
      size_changing_button_id: :real_time_info_minimize_button ,
      add_update_button: true ,
      update_button_id: :update_button_in_content_header_of_real_time_infos ,
      controller_of_updating_real_time_info_form: :update ,
      action_of_updating_real_time_info_form: :normal
    )
  end

end
