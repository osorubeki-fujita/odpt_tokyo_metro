class TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::Whole < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::Whole

  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::MultipleRailwayLines::Common

  # 乗車位置情報のタブを作成
  def render_tab
    h.render inline: <<-HAML , type: :haml , locals: { this: self , onclick: onclick }
%li{ class: [ "tab_for_" + this.tab_name , :platform_info_tab , :clearfix ] }<
  %div{ class: [ :railway_line_name , :clearfix ] , onclick: raw( onclick ) }
    - this.railway_line_infos.each do | railway_line_info |
      - railway_line_info_decorated = railway_line_info.decorate
      %div{ class: railway_line_info_decorated.css_class }
        = railway_line_info_decorated.code_domain.render( small: true )
    = this.render_railway_line_text_name
    HAML
  end

  private

  def onclick
    "changeStationFacilityPlatformInfoTabByPageLink( '#{ tab_name }' , true ) ; return false ;"
  end

end
