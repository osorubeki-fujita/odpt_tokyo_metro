module TokyoMetro::App::Renderer::Concerns::Header::Content::SizeChangingButtonType

  private

  def size_changing_button_type
    case @visibility.to_s
    when "visible"
      :minimize
    when "hidden"
      :display
    end
  end

end
