class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::RealTimeInfos::TrainLocation < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass

  def initialize( request , railway_line_decorated )
    super( request , railway_line_decorated )

    @suffix_ja = "の列車位置情報"
    @prefix_en = "Current positions of trains on"

    @controller = :train_location
    @link_type = :standard
  end

end
