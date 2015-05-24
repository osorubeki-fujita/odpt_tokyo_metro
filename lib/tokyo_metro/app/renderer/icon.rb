module TokyoMetro::App::Renderer::Icon

  FONT_AWESOME_ICON = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/view/icon/font_awesome_icon.yaml" )
  IMAGE = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/view/icon/image.yaml" )

  raise if ( FONT_AWESOME_ICON.keys & IMAGE.keys ).present?

  def self.font_awesome_icons
    FONT_AWESOME_ICON
  end

  def self.images
    IMAGE
  end

  FONT_AWESOME_ICON.each do | key , value |
    eval <<-DEF
      def self.#{ key }( request , size = 1 , spin: nil , pulse: nil , inverse: nil )
        FontAwesome.new( request , "#{ value }" , size , spin: spin , pulse: pulse , inverse: inverse )
      end
    DEF
  end

  IMAGE.each do | key , value |
    eval <<-DEF
      def self.#{ key }( request , size = 1 , class_name: nil )
        Image.new( request , "#{ value }" , class_name: class_name )
      end
    DEF
  end

  # def self.open_another_window( request , size = 1 )
    # FontAwesome::Stacked.new( request , [ { icon_name: :square_stroked , size: size } , { icon_name: :open_another_window_base , size: size } ] )
  # end

  # def self.link_to_another_website( request , size = 1 )
    # FontAwesome::Stacked.new( request , [ { icon_name: :square_filled , size: size } , { icon_name: :link_to_another_website_base , size: size , inverse: true } ] )
  # end

end

＿END__

# @todo

FontAwesome::Stacked
FontAwesome::Spin
FontAwesome::Pulse

に分離
