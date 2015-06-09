class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass::Group < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass

  def render_railway_line_name
    h.render inline: <<-HAML , type: :haml , locals: h_locals_for_rendering_railway_line_name
%li{ class: li_classes }
  = link_to_unless( without_link_to_railway_line_page , "" , url )
  %div{ class: div_classes }
    = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
    = railway_line_decorated.render_name( prefix_ja: prefix_ja , prefix_en: prefix_en , suffix_ja: suffix_ja , suffix_en: suffix_en )
    HAML
  end

  private

  alias :__h_locals__ :h_locals

  def h_locals_for_rendering_railway_line_name
    __h_locals__.merge({
      this: self
    })
  end
  
  def h_locals
    {
      this: self ,
      request: @request ,
      railway_line_decorated: @railway_line_decorated
    }
  end

end
