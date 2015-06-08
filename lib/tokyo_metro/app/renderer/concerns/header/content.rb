class TokyoMetro::App::Renderer::Concerns::Header::Content < TokyoMetro::App::Renderer::Concerns::Header::Title

  def initialize(
    request , domain_class_name , icon_name , text_ja , text_en ,
    domain_id_name: nil ,
    icon_size: 3 ,
    size_changing_button_type: nil , size_changing_button_id: nil ,
    add_update_button: false , update_button_id: nil ,
    controller_of_updating_real_time_info_form: nil , action_of_updating_real_time_info_form: nil ,
    additional_content: nil
  )

    raise "Error" if add_update_button and update_button_id.blank?
    raise "Error" if !( add_update_button ) and update_button_id.present?
    raise "Error" if size_changing_button_type.present? and size_changing_button_id.blank?
    raise "Error" if size_changing_button_type.blank? and size_changing_button_id.present?

    super(
    request , text_ja , text_en ,
    domain_id_name: domain_id_name ,
    domain_class_name: domain_class_name ,
    icon_name: icon_name ,
    icon_size: icon_size ,
    additional_content: additional_content
  )
    @size_changing_button_type = size_changing_button_type
    @size_changing_button_id = size_changing_button_id

    @add_update_button = add_update_button
    @update_button_id = update_button_id
    @controller_of_updating_real_time_info_form = controller_of_updating_real_time_info_form
    @action_of_updating_real_time_info_form = action_of_updating_real_time_info_form
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ class: [ domain_class_name , :content_header , :clearfix ] , id: domain_id_name }

  - # icon , text

  - if icon_name.present?
    %div{ class: :icon }<
      = ::TokyoMetro::App::Renderer::Icon.send( icon_name , request , icon_size ).render
  - if text_ja.present?
    %div{ class: :text }
      %h3{ class: :text_ja }<
        - if text_ja.instance_of?( ::Proc )
          = text_ja.call
        - else
          = text_ja
      %h4{ class: :text_en }<
        - if text_en.instance_of?( ::Proc )
          = text_en.call
        - else
          = text_en
  - else
    %h3{ class: :text_en }<
      - if text_en.instance_of?( ::Proc )
        = text_en.call
      - else
        = text_en

  - # size_changing_button

  - if size_changing_button_type.present?
    %div{ id: size_changing_button_id , class: [ :size_changing_button , size_changing_button_type ] }<
      = button_tag( type: :button ) do
        = ::TokyoMetro::App::Renderer::Icon.send( size_changing_button_type , request , 1 ).render

  - # add_update_button

  - if add_update_button
    %div{ id: update_button_id , class: :update_button }<
      = form_tag( url_in_updating_real_time_info_form , remote: true , class: class_name_of_updating_real_time_info_form_button ) do
        = button_tag( type: :submit ) do
          = ::TokyoMetro::App::Renderer::Icon.updating( request , 1 ).render

  - # additional_content

  - if additional_content.present?
    = additional_content.call
    HAML
  end

  private

  def h_locals
    super.merge( {
      size_changing_button_type: @size_changing_button_type ,
      size_changing_button_id: @size_changing_button_id ,
      #
      # url_in_size_setting_form: url_in_size_setting_form ,
      # class_name_of_size_setting_form_button: class_name_of_size_setting_form_button ,
      #
      add_update_button: @add_update_button ,
      update_button_id: @update_button_id ,
      #
      url_in_updating_real_time_info_form: url_in_updating_real_time_info_form ,
      class_name_of_updating_real_time_info_form_button: class_name_of_updating_real_time_info_form_button
    } )
  end

  def url_in_updating_real_time_info_form
    if @add_update_button
      u.url_for( controller: @controller_of_updating_real_time_info_form , action: @action_of_updating_real_time_info_form , only_path: true )
    else
      nil
    end
  end

  def class_name_of_updating_real_time_info_form_button
    if @add_update_button
      :ajax_link_to_update_real_time_info
    else
      nil
    end
  end

end
