class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::RealTimeInfos::TrainOperation < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass

  def initialize( request , railway_line_decorated )
    super( request , railway_line_decorated )

    @suffix_ja = "の列車運行情報"
    @prefix_en = "Operation info of"

    @controller = :train_operation
    @link_type = :standard

    @station_info = station_info
    @add_connection_info_to_class = true
  end

end
