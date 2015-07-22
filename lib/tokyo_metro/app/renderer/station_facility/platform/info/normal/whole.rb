class TokyoMetro::App::Renderer::StationFacility::Platform::Info::Normal::Whole < TokyoMetro::App::Renderer::StationFacility::Platform::Info::MetaClass::Whole

  include ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::Normal::Common

  # 乗車位置情報のタブを作成
  def render_tab
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%li{ class: [ "tab_for_" + this.tab_name.to_s , :platform_info_tab , this.railway_line.css_class , :clearfix ] }<
  %div{ class: [ :railway_line_name , :clearfix ] , onclick: raw( "changeStationFacilityPlatformInfoTabByPageLink('" + this.tab_name.to_s + "' , true ) ; return false ; " ) }
    = this.railway_line.decorate.code.render( small: true )
    = this.render_railway_line_text_name
    HAML
  end

  private

  def set_railway_line( railway_lines )
    raise "Error" unless railway_lines.length == 1
    @railway_line = railway_lines.first
  end

end
