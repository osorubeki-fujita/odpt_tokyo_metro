class TokyoMetro::App::Renderer::FareTable::LinkToRailwayLinePage::Header < TokyoMetro::App::Renderer::Concerns::Header::Content

  def initialize( request , station_info_decorated , *railway_lines )
    @railway_line = railway_lines.flatten.first
    @station_info_decorated = station_info_decorated
    super(
      request ,
      :title ,
      :yen ,
      proc_for_text_ja ,
      proc_for_text_en ,
      icon_size: 3
    )
  end

  private

  def proc_for_text_ja
    ::Proc.new { @station_info_decorated.render_name_ja( with_subname: true , suffix: "駅から#{ @railway_line.name_ja }各駅までの運賃" ) }
  end

  def proc_for_text_en
    ::Proc.new { @station_info_decorated.render_name_en( with_subname: true , prefix: "Fares from " , suffix: " to stations on #{ @railway_line.name_en }" ) }
  end

end
