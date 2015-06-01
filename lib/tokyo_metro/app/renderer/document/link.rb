class TokyoMetro::App::Renderer::Document::Link < TokyoMetro::App::Renderer::Concerns::Link::Normal::MetaClass

  def initialize( request , title_ja , title_en , url_action , model_name , icon_name: nil )
    @model_name = model_name
    url = url_helpers.url_for( controller: :document , action: url_action , only_path: true )
    super(
      request , title_ja , title_en , url ,
      icon_name: icon_name ,
      class_name_of_link: :link ,
      class_name_of_text_domain: :link_to_document ,
      open_another_window: false ,
      size: :normal ,
      additional_info: additional_info ,
      additional_info_position: :in_text
    )
  end

  private

  def additional_info
    ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: { model_name: @model_name }
%div{ class: [ :model_name , :text_en ] }<
  = "Model: " + model_name
      HAML
    }
  end

  def link_for_page_on_the_same_category?
    nil
  end

end
