class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass < TokyoMetro::App::Renderer::MetaClass

  def initialize( request , railway_line_decorated )
    super( request )
    @railway_line_decorated = railway_line_decorated
  end

=begin
    small_railway_line_code: true ,
    add_connection_info_to_class: false , station_info: nil ,
    prefix_ja: nil , prefix_en: nil , suffix_ja: nil , suffix_en: nil ,
    additional_class_of_li: nil ,
    link_type: :railway_line_page_under_action_for_station ,
    controller: nil ,
    survey_years: nil
=end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: li_classes }
  = link_to_unless_current( "" , url )
  %div{ class: div_classes }
    = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
    = railway_line_decorated.render_name( prefix_ja: prefix_ja , prefix_en: prefix_en , suffix_ja: suffix_ja , suffix_en: suffix_en )
    HAML
  end

  private

  def railway_line_object
    @railway_line_decorated.object
  end
  
  def railway_line_page_name
    @railway_line_decorated.railway_line_page_name
  end

  def li_classes
    ary = [ :railway_line , :small ]

    if add_railway_line_css_class_name_to_li_classes?
      ary << @railway_line_decorated.css_class_name
    end

    if @additional_class_of_li.present?
      ary << @additional_class_of_li
    end

    if current_railway_line = "#{ railway_line_object.css_class_name }_line"
      ary << :this_page
    end

    ary.flatten
  end

  def div_classes
    [ :link_to_railway_line_page ]
  end

  def add_railway_line_css_class_name_to_li_classes?
    true
  end

  def h_locals
    h_base = super.merge({
      railway_line_decorated: @railway_line_decorated ,
      small_railway_line_code: @small_railway_line_code ,
      prefix_ja: @prefix_ja ,
      prefix_en: @prefix_en ,
      suffix_ja: @suffix_ja ,
      suffix_en: @suffix_en ,
      link_type: @link_type ,
      controller: @controller ,
      li_classes: li_classes ,
      div_classes: div_classes
    })
    if url.present?
      h_base.merge({ url: url })
    else
      h_base
    end
  end

  private

  def url
    case @link_type
    when :railway_line_page_under_action_for_station
      url_helpers.url_for( controller: @controller , railway_line: railway_line_page_name )
    when :action_for_station , :standard
      url_helpers.url_for( controller: @controller , action: railway_line_page_name )
    end
  end

end