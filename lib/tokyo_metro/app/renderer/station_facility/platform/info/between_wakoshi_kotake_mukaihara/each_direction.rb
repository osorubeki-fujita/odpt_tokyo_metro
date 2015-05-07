class TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara::EachDirection < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::EachDirection

  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara::Common

  def of_special_direction?
    @railway_direction.railway_line.same_as == "odpt.Railway:TokyoMetro.Yurakucho" and @railway_direction.same_as == "odpt.RailwayDirection:TokyoMetro.Yurakucho.ShinKiba"
  end

  def render_special_direction_ja
    h.render inline: <<-HAML , type: :haml
= "小竹向原・池袋・"
%span{ class: :railway_line_name }<>
  ="有楽町線"
= "新木場・"
%span{ class: :railway_line_name }<>
  = "副都心線"
= "渋谷" + "方面行きホーム"
    HAML
  end

  def special_direction_en
    "Platform for Kotake-mukaihara, Ikebukuro, Shin-kiba (Yurakucho Line) and Shibuya (Fukutoshin Line)"
  end

end