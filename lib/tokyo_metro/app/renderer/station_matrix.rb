# 駅一覧表（路線別）を作成するためのクラス
class TokyoMetro::App::Renderer::StationMatrix < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_lines , make_link_to_railway_line: false , type_of_link_to_station: nil , set_anchor: false , controller_of_linked_page_from_railway_line: nil )
    super( request )
    @railway_lines = railway_lines.except_for_branch_lines
    @make_link_to_railway_line = make_link_to_railway_line
    @type_of_link_to_station = type_of_link_to_station
    @set_anchor = set_anchor
    @controller_of_linked_page_from_railway_line = controller_of_linked_page_from_railway_line
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
= ::TokyoMetro::App::Renderer::Concerns::Header::Selection.station_from_railway_line( request ).render
%div{ id: :station_matrixes }
  - railway_lines.each do | railway_line |
    = railway_line.decorate.matrix.on( request ).render_with_links_to_stations( make_link_to_railway_line , type_of_link_to_station , set_anchor , controller_of_linked_page_from_railway_line: controller_of_linked_page_from_railway_line )
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_lines: @railway_lines ,
      make_link_to_railway_line: @make_link_to_railway_line ,
      type_of_link_to_station: @type_of_link_to_station ,
      set_anchor: @set_anchor ,
      controller_of_linked_page_from_railway_line: controller_of_linked_page_from_railway_line
    })
  end

end
