class TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::PassengerSurvey < TokyoMetro::App::Renderer::Concerns::Link::ToRailwayLinePage::MetaClass::Group

  def initialize( request , railway_line_decorated , survey_years , additional_class_of_li: nil )
    super( request , railway_line_decorated )

    @controller = :passenger_survey
    @link_type = :action_for_station

    @suffix_ja = "の各駅"
    @prefix_en = "Stations on"

    @survey_years = survey_years.sort.reverse
    @additional_class_of_li = additional_class_of_li
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ class: [ :each_railway_line , railway_line_decorated.css_class_name , :clearfix ] }
  = this.render_railway_line_name
  - survey_year_max = survey_years.max
  - survey_years.each do | survey_year |
    = ::TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::MetaClass::EachYear.new( request , survey_year , survey_year_max , railway_line_page_name ).render
    HAML
  end

  private

  def add_railway_line_css_class_name_to_li_classes?
    false
  end

  def url
    url_helpers.url_for(
      controller: @controller ,
      action: :action_for_railway_line_or_year_page ,
      railway_line: railway_line_page_name ,
      only_path: true
    )
  end

  def without_link_to_railway_line_page?
    link_to_current_page? or link_to_railway_line_page_is_link_to_the_same_page?
  end

  def link_to_current_page?
    current_page?( url )
  end

  def link_to_railway_line_page_is_link_to_the_same_page?
    current_page?(
      controller: @controller ,
      action: :action_for_railway_line_or_year_page ,
      railway_line: railway_line_page_name ,
      survey_year: @survey_years.max.to_s
    )
  end

  def h_locals
    {
      request: request ,
      survey_years: @survey_years ,
      railway_line_page_name: railway_line_page_name
    }
  end

  # def additional_li_classes_to_link_to_this_page
    # :this_railway_line
  # end

end
