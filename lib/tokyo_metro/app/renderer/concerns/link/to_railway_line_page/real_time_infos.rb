class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::RealTimeInfos < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass::Group

  def initialize( request , railway_line_decorated )
    super( request , railway_line_decorated )

    @controller = nil
    @controllers = [ :train_operation , :train_location ]
    @link_type = :standard
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ class: [ :each_railway_line , railway_line_decorated.css_class_name , :clearfix ] }
  = this.render_railway_line_name
  - controllers.each do | controller |
    = ::TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinkToRailwayLinePage::EachController.new( request , controller , railway_line_page_name ).render
    HAML
  end

  private

  def add_railway_line_css_class_name_to_li_classes?
    false
  end

  def url
    nil
  end

  def without_link_to_railway_line_page?
    true
  end

  def h_locals
    super.merge({
      controllers: @controllers
    })
  end

end
