class TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinkToRailwayLinePage::EachController < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , controller , railway_line_page_name )
    super( request )
    @controller = controller
    @railway_line_page_name = railway_line_page_name

    set_url
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: li_classes }
  = link_to_unless( without_link , "" , url )
  %p{ class: :text_en }<
    = ::TokyoMetro::App::Renderer::Icon.send( controller , request , 2 ).render
    HAML
  end

  private

  def set_url
    @url = url_helpers.url_for(
      controller: @controller ,
      action: :action_for_railway_line_page ,
      railway_line: @railway_line_page_name ,
      only_path: true
    )
  end

  def h_locals
    super.merge({
      controller: @controller ,
      url: @url ,
      without_link: without_link? ,
      li_classes: li_classes
    })
  end

  def without_link?
    current_page?( @url )
  end

  def li_classes
    ary = [ "to_#{ @controller }" , :each_controller ]
    if without_link?
      ary << :this_page
    end
    ary
  end

end
