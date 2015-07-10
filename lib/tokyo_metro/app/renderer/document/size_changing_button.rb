class TokyoMetro::App::Renderer::Document::SizeChangingButton < TokyoMetro::Factory::Decorate::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ class: :size_changing_buttons }
  - icon_names.each do | icon_name |
    %li{ class: [ :size_changing_button , icon_name ] }
      = ::TokyoMetro::App::Renderer::Icon.send( icon_name , nil , 1 ).render
    HAML
  end

  private

  def h_locals
    super.merge({
      icon_names: [
        :display_all ,
        :display ,
        :minimize ,
        :minimize_all
      ]
    })
  end

end
