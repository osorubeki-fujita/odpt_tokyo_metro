class TokyoMetro::App::Renderer::SideMenu::Link::MetaClass < TokyoMetro::App::Renderer::Concerns::Link::Normal::MetaClass

  def initialize( request , title_ja , title_en , url , icon_name: nil , class_name_of_link: :link , class_name_of_div_domain: nil , open_another_window: false , size: :normal , additional_info: nil , additional_info_position: nil , link_to_another_website: false )
    super(
      request , title_ja , title_en , url ,
      icon_name: icon_name ,
      class_name_of_link: class_name_of_link ,
      class_name_of_div_domain: class_name_of_div_domain ,
      open_another_window: open_another_window ,
      size: size ,
      additional_info: additional_info ,
      additional_info_position: additional_info_position ,
      link_to_another_website: link_to_another_website
    )
  end

end
