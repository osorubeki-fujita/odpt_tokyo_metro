module TokyoMetro::App::Renderer::Concerns::Header::Content::SizeSettingButtonType

  private

  def size_setting_button_type
    case @visibility.to_s
    when "visible"
      :minimize
    when "hidden"
      :display
    end
  end

end
