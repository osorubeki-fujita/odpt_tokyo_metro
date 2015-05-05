class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::PassengerSurvey < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass

  def initialize( request , railway_line_decorated , survey_years , additional_class_of_li: nil )
    super( request , railway_line_decorated )

    @controller = :passenger_survey
    @link_type = :action_for_station

    @small_railway_line_code = true
    @suffix_ja = "の各駅"
    @prefix_en = "Stations on"

    @survey_years = survey_years.sort.reverse
    @additional_class_of_li = additional_class_of_li
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ class: [ :each_railway_line , railway_line_decorated.css_class_name ] }
  %li{ class: li_classes }
    = link_to_unless_current( "" , url_for_railway_line_page )
    %div{ class: div_classes }
      = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
      = railway_line_decorated.render_name( prefix_ja: prefix_ja , prefix_en: prefix_en , suffix_ja: suffix_ja , suffix_en: suffix_en )
  - survey_years.each do | survey_year |
    - url = url_for( common_setting_of_url_for_year_page.merge( { survey_year: survey_year } ) )
    %li{ class: :survey_year }
      = link_to_unless_current( "" , url )
      %p{ class: :text_en }<
        = survey_year
    HAML
  end

  private

  def add_railway_line_css_class_name_to_li_classes?
    false
  end

  def url
    nil
  end

  def h_locals
    super.merge({
      survey_years: @survey_years ,
      url_for_railway_line_page: url_helpers.url_for(
        host: current_host ,
        controller: @controller ,
        action: :action_for_railway_line_or_year_page ,
        railway_line: railway_line_page_name
      ) ,
      common_setting_of_url_for_year_page: {
        controller: @controller ,
        action: :action_for_railway_line_or_year_page ,
        railway_line: railway_line_page_name
      }
    })
  end 

end
