class TokyoMetro::App::Renderer::SideMenu::Link::ToDocument < TokyoMetro::App::Renderer::SideMenu::Link::MetaClass

  def initialize( request , title_ja , title_en , url , icon_name: nil )
    super(
      request ,
      title_ja ,
      title_en ,
      url ,
      icon_name: icon_name ,
      class_name_of_link: :link ,
      class_name_of_div_domain: :link_to_document ,
      open_another_window: link_for_page_on_the_same_controller? ,
      size: :small
    )
  end

  alias :__link_for_page_on_the_same_category?__ :link_for_page_on_the_same_category?

  def link_for_page_on_the_same_category?
    __link_for_page_on_the_same_category?__ and link_for_page_of_the_same_action?
  end

  def self.development_document( request )
    self.new(
      request ,
      "開発ドキュメント" ,
      "Document" ,
      url_helpers.url_for( controller: :document , action: :index , only_path: true ) ,
      icon_name: :development_document
    )
  end

  def self.how_to_use( request )
    self.new(
      request ,
      "マニュアル・開発者より" ,
      "How to use \'Rails on Ruby\'" ,
      url_helpers.url_for( controller: :document , action: :how_to_use , only_path: true ) ,
      icon_name: :how_to_use
    )
  end

  def self.disclaimer( request )
    self.new(
      request ,
      "免責事項" ,
      "Disclaimer" ,
      url_helpers.url_for( controller: :application , action: :disclaimer , only_path: true ) ,
      icon_name: :temp
    )
  end

  def self.remark( request )
    self.new(
      request ,
      "ご利用上の注意" ,
      "Plase note" ,
      url_helpers.url_for( controller: :application , action: :remark , only_path: true ) ,
      icon_name: :temp
    )
  end

  def self.another_page( request )
    self.new(
      request ,
      "開発続行用 別サイト" ,
      "Another website for continuing to develop" ,
      "http://tokyosubway.heroku.com/" ,
      icon_name: :temp
    )
  end

end
