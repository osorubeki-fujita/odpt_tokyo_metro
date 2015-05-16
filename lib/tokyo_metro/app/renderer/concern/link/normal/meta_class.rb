class TokyoMetro::App::Renderer::Concern::Link::Normal::MetaClass < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , title_ja , title_en , url , icon_name: nil , class_name_of_whole_domain: nil , class_name_of_link: :link , class_name_of_text_domain: nil , open_another_window: false , size: :normal , additional_info: nil , additional_info_position: nil , link_to_another_website: false )
    super( request )

    raise "Error" if title_ja.blank? and title_en.blank?
    raise "Error" if class_name_of_text_domain.blank?

    raise "Error" if additional_info.present? and additional_info_position.blank?
    raise "Error" if additional_info.blank? and additional_info_position.present?

    raise "Error" if link_to_another_website and !( open_another_window )

    @title_ja = title_ja
    @title_en = title_en
    @url = url
    @icon_name = icon_name
    @class_name_of_whole_domain = class_name_of_whole_domain
    @class_name_of_link = class_name_of_link
    @class_name_of_text_domain = class_name_of_text_domain
    @open_another_window = open_another_window
    @size = size

    @additional_info = additional_info
    @additional_info_position = additional_info_position

    @link_to_another_website = link_to_another_website
  end

  def render
    _h_locals = h_locals
    h.render inline: <<-HAML , type: :haml , locals: _h_locals
%li{ class: [ li_class_name , :clearfix ].flatten }<
  = v.link_to_unless( link_to_current_page , "" , url , only_path_setting: false , class: class_name_of_link , target: target )
  %div{ class: [ class_name_of_text_domain , :clearfix ].flatten }<
    - # Icon
    - if icon_name.present?
      %div{ class: :icon }
        = ::TokyoMetro::App::Renderer::Icon.send( icon_name , request ).render

    - # Title
    - if title_ja.present? and title_en.present?
      - # Title (1)
      %div{ class: [ :text , :clearfix ] }
        - if title_ja.instance_of?( ::Array )
          %div{ class: :text_ja }<
            - title_ja.each do | row |
              %p<
                = row
        - else
          %p{ class: :text_ja }<
            = title_ja
        - if title_en.instance_of?( ::Array )
          %div{ class: :text_en }<
            - title_ja.each do | row |
              %p<
                = row
        - else
          %p{ class: :text_en }<
            = title_en
      - if additional_info.present?
        = additional_info.call
    - else
      - # Title (2)
      %div{ class: :text_large }
        - if title_ja.present?
          - text = title_ja
        - elsif title_en.present?
          - text = title_en
        - if text.instance_of?( ::Array )
          - text.each do | row |
            %p<
              = row
        - else
          %p<
            = text
      - if additional_info.present?
        = additional_info.call
    - # External Link
    - if open_another_window
      - if link_to_another_website
        %div{ class: :link_to_another_website }
          = ::TokyoMetro::App::Renderer::Icon.link_to_another_website( request , 1 ).render
      - else
        %div{ class: :open_another_window }
          = ::TokyoMetro::App::Renderer::Icon.open_another_window( request , 1 ).render
    HAML
  end

  private

  def open_another_window?
    @open_another_window
  end

  def target
    if open_another_window?
      :_blank
    else 
      nil
    end
  end

  def h_locals
    super.merge( {
      title_ja: @title_ja ,
      title_en: @title_en ,
      url: @url ,
      icon_name: @icon_name ,
      class_name_of_link: [ @class_name_of_link ].flatten.uniq.sort ,
      class_name_of_text_domain: @class_name_of_text_domain ,
      li_class_name: li_class_name ,
      target: target ,
      open_another_window: open_another_window? ,
      additional_info: @additional_info ,
      additional_info_position: @additional_info_position ,
      link_to_another_website: @link_to_another_website ,
      link_to_current_page: link_to_current_page?
    } )
  end

  def li_class_name
    if @class_name_of_whole_domain.present?
      ary = [ @class_name_of_whole_domain , @size ].flatten
    else
      ary = [ @size ]
    end
    if link_for_page_on_the_same_category?
      ary << [ :same_category ]
    end
    ary
  end

  # def link_to_page_on_the_same_host?
    # @request.host == host_of( @url )
  # end

  def link_to_current_page?
    @request.fullpath == @url
  end

  def link_for_page_on_the_same_controller?
    current_page?( controller: controller_of( @url ) )
  end

  def link_for_page_on_the_same_category?
    !( @link_to_another_website ) and link_for_page_on_the_same_controller?
  end

  def link_for_page_of_the_same_action?
    current_page?( action: action_of( @url ) )
  end

end