class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_decorated )
    super( request )
    @railway_line_decorated = railway_line_decorated
    @small_railway_line_code = true
    raise unless valid_railway_line_decorator_class?
  end

  def render
    if to_render?
      h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: li_classes }
  - if url.present?
    = link_to_unless( without_link_to_railway_line_page , "" , url )
  %div{ class: div_classes }
    = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
    = railway_line_decorated.render_name( prefix_ja: prefix_ja , prefix_en: prefix_en , suffix_ja: suffix_ja , suffix_en: suffix_en )
    - if optional_info_to_display.present?
      = optional_info_to_display.call
      HAML
    end
  end

  private
  
  def object
    @railway_line_decorated.object
  end

  def railway_line_object
    object.railway_line
  end
  
  def railway_line_page_name
    @railway_line_decorated.railway_line_page_name
  end

  def li_classes
    ary = [ :railway_line , :small ]

    if add_railway_line_css_class_name_to_li_classes?
      ary << railway_line_object.css_class_name
    end

    if @additional_class_of_li.present?
      ary << @additional_class_of_li
    end

    if link_to_this_page?
      ary << additional_li_classes_to_link_to_this_page
    end

    ary.flatten
  end
  
  def additional_li_classes_to_link_to_this_page
    :this_page
  end

  def div_classes
    ary = ::Array.new
    ary << :clearfix 
    if without_link_to_railway_line_page?
      ary << :railway_line_without_link
    else
      ary << :with_link_to_railway_line_page
    end
    ary
  end

  def add_railway_line_css_class_name_to_li_classes?
    true
  end

  def link_to_this_page?
    current_railway_line ==  @railway_line_decorated.page_name
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
      div_classes: div_classes ,
      optional_info_to_display: optional_info_to_display ,
      url: url ,
      without_link_to_railway_line_page: without_link_to_railway_line_page?
    })
  end

  def url
    case @link_type
    when :railway_line_page_under_action_for_station
      url_helpers.url_for( controller: @controller , action: :action_for_station_page , station: current_station , railway_line: railway_line_page_name , only_path: true )
    when :action_for_station , :standard
      url_helpers.url_for( controller: @controller , action: railway_line_page_name , only_path: true )
    end
  end
  
  def without_link_to_railway_line_page?
    request.fullpath == url
  end

  def valid_railway_line_decorator_class?
    @railway_line_decorated.instance_of?( ::RailwayLineDecorator )
  end

  def optional_info_to_display
    nil
  end

  def to_render?
    true
  end

end