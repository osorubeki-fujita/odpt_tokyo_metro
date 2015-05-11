class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::Fare < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass

  def initialize( request , railway_line_decorated , station_info )
    super( request , railway_line_decorated )

    @suffix_ja = "の各駅まで"
    @prefix_en = "To stations on"

    @controller = :fare
    @link_type = :railway_line_page_under_action_for_station

    @station_info = station_info
    @add_connection_info_to_class = true
  end

  private

  def li_classes
    ary = super()
    if !( this_page? ) and this_station?
      ary << :this_station
    end
    ary
  end

  def this_station?
    @station_info.connected_to?( railway_line_object , only_tokyo_metro: true , include_myself: true )
  end

  def link_to_this_page?
    super() or ( current_railway_line.blank? and @station_info.railway_line.id == railway_line_object.id )
  end

  def h_locals
    super.merge({
      station_info: @station_info ,
      add_connection_info_to_class: @add_connection_info_to_class
    })
  end

end