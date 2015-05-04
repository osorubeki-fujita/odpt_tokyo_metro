class TokyoMetro::App::Renderer::Icon::FontAwesome < TokyoMetro::App::Renderer::MetaClass

  def initialize( request , icon_name , size = 1 , spin: nil , pulse: nil )
    raise if spin and pulse
    super( request )
    @icon_name = icon_name
    @size = size
    @spin = spin
    @pulse = pulse
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
= content_tag( :i , "" , class: classes )
    HAML
  end

  private

  def classes
    ary = [ :fa , "fa-#{ @icon_name }" , "fa-#{ @size }x" ]
    
    if @spin
      ary << [ "fa-spin" ]
    end
    if @pulse
      ary << [ "fa-pulse" ]
    end

    return ary
  end

  def h_locals
    super().merge({
      classes: classes
    })
  end

end