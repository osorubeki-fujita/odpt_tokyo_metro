module TokyoMetro::Modules::Color::Static::Fundamental::GetColorInfo

  private

  def get_web_color_of( var )
    var.web_color
  end

  def get_rgb_color_in_parentheses_of( var )
    var.to_s_rgb_color_in_parentheses
  end

  [ :red , :green , :blue ].each do | color_element |
    eval <<-DEF
      def get_#{ color_element }_element_of( var )
        var.#{ color_element }
      end
    DEF
  end

end
