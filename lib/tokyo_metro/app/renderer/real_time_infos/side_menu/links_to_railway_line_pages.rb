class TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinksToRailwayLinePages < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request )
    super( request )
    @railway_lines = ::RailwayLine.tokyo_metro( including_branch_line: false )
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :links_to_real_time_info_pages_of_railway_lines }
  %div{ class: :title }<
    = "各路線の列車運行・位置情報"
  %ul{ id: :links_to_railway_line_pages , class: [ :links , :clearfix ] }
    - railway_lines.each do | railway_line |
      = ::TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinkToRailwayLinePage.new( request , railway_line.decorate ).render
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_lines: @railway_lines
    })
  end

end
