class TokyoMetro::App::Renderer::StationLinkList < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , stations )
    super( request )
    @ja = ::TokyoMetro::App::Renderer::StationLinkList::Japanese.new( request , stations )
    @en = ::TokyoMetro::App::Renderer::StationLinkList::English.new( request , stations )
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
= ::TokyoMetro::App::Renderer::Concerns::Header::Selection.station_from_list( request ).render
%div{ id: :station_link_list }
  = ja.render
  = en.render
    HAML
  end

  private

  def h_locals
    super.merge({
      ja: @ja ,
      en: @en
    })
  end

end
