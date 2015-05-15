class TokyoMetro::App::Renderer::Icon::FontAwesome::Stacked < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , icon_settings )
    raise unless icon_settings.instance_of?( ::Array )
    raise unless icon_settings.length == 2
    raise unless icon_settings.all? { | item | item.instance_of?( ::Hash ) }
    raise unless icon_settings.all? { | item | item.keys.include?( :icon_name ) }
    raise unless icon_settings.all? { | item | item.keys.include?( :size ) }

    super( request )
    @icon_settings = icon_settings
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%span{ class: [ "fa-stack" , "fa-lg" ] }
  - icon_settings.each do | icon |
    = ::TokyoMetro::App::Renderer::Icon.send( icon[ :icon_name ] , request , icon[ :size ] , spin: icon[ :spin ] , pulse: icon[ :pulse ] , inverse: icon[ :inverse ] ).render
    HAML
  end
  
  private

  def h_locals
    super().merge({
      icon_settings: @icon_settings
    })
  end

end