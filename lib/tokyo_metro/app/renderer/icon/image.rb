class TokyoMetro::App::Renderer::Icon::Image < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , image_filename , size , class_name: nil )
    super( request )
    @image_filename = image_filename
    @class_name = class_name
    @size = size
  end

  def render
    h.image_tag( @image_filename , class: classes )
  end

  private

  def classes
    ary = []
    if @class_name.present?
      ary << @class_name
    end

    ary << "icon_img_#{ @size }x"

    ary
  end

end
