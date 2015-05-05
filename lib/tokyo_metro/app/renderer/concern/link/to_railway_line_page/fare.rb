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
    if @station_info.connected_to?( railway_line_object , only_tokyo_metro: true )
      ary << :this_station
    end
    ary
  end

  def h_locals
    super.merge({
      station_info: @station_info ,
      add_connection_info_to_class: @add_connection_info_to_class
    })
  end

end