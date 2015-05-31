module TokyoMetro::App::Renderer::Concern::Header::Content::SizeSettingButtonType

  private

  def size_setting_button_type
    case @visibility
    when :visible
      :minimize
    when :hidden
      :display
    end
  end

end
