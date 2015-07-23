class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MeguroAndShirokanedai::EachDirection < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::EachDirection

  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenMeguroAndShirokaneTakanawa::Common
  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenMeguroAndShirokaneTakanawa::OfSpecialDirection

  def render_special_direction_ja
    h.render inline: <<-HAML , type: :haml
= "白金高輪・"
%span{ class: :railway_line_name }<>
  ="南北線"
= "赤羽岩淵・"
%span{ class: :railway_line_name }<>
  = "都営三田線"
= "西高島平" + "方面行きホーム"
    HAML
  end

  def special_direction_en
    "Platform for Shirokane-takanawa, Akabane-iwabuchi (Namboku Line) and Nishi-takashimadaira (Toei Mita Line)"
  end

end
