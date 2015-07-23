class TokyoMetro::App::Renderer::StationFacility::Platform::Info::KotakeMukaihara::EachDirection < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::EachDirection

  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara::Common
  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara::OfSpecialDirection

  def render_special_direction_ja
    h.render inline: <<-HAML , type: :haml
= "池袋・"
%span{ class: :railway_line_name }<>
  ="有楽町線"
= "新木場・"
%span{ class: :railway_line_name }<>
  = "副都心線"
= "渋谷" + "方面行きホーム"
    HAML
  end

  def special_direction_en
    "Platform for Ikebukuro, Shin-kiba (Yurakucho Line) and Shibuya (Fukutoshin Line)"
  end

end
