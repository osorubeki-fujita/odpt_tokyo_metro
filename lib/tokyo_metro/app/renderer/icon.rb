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
        Image.new( request , "#{ value }" , size , class_name: class_name )
      end
    DEF
  end

end
