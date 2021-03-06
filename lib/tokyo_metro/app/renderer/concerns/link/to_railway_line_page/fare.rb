class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::Fare < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass

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
    if !( link_to_this_page? ) and railway_line_on_this_station?
      ary << :this_station
    end
    ary
  end

  def link_to_this_page?
    super() or ( railway_line_param_is_not_set? and railway_line_of_station_info_and_railway_line_info_object_is_the_same? )
  end

  def railway_line_param_is_not_set?
    current_railway_line.blank?
  end

  def railway_line_of_station_info_and_railway_line_info_object_is_the_same?
    @station_info.railway_line_info.id == railway_line_info_object.id
  end

  def railway_line_on_this_station?
    @station_info.connected_to?( railway_line_info_object , only_of_the_same_operator: true , include_myself: true )
  end

  def h_locals
    super.merge({
      station_info: @station_info ,
      add_connection_info_to_class: @add_connection_info_to_class
    })
  end

end
