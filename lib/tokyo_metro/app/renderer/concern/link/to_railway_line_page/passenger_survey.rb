class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::PassengerSurvey < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::MetaClass

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
  %li{ class: li_classes }
    = link_to_unless( add_link_to_railway_line_page , "" , url_for_railway_line_page )
    %div{ class: div_classes }
      = railway_line_decorated.render_railway_line_code( small: small_railway_line_code )
      = railway_line_decorated.render_name( prefix_ja: prefix_ja , prefix_en: prefix_en , suffix_ja: suffix_ja , suffix_en: suffix_en )
  - survey_years.each do | survey_year |
    - url = u.url_for( common_setting_of_url_for_year_page.merge( { survey_year: survey_year } ) )
    %li{ class: :survey_year }
      = link_to_unless( proc_for_deciding_whether_add_link_to_year_page.call( survey_year ) , "" , url )
      - # = link_to_unless( request.fullpath == url , "" , url )
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

  def url_for_railway_line_page
    url_helpers.url_for(
      controller: @controller , 
      action: :action_for_railway_line_or_year_page ,
      railway_line: railway_line_page_name ,
      only_path: true
    )
  end

  def add_link_to_railway_line_page?
    link_to_current_page? or link_to_railway_line_page_is_link_to_the_same_page?
  end

  def link_to_current_page?
    fullpath == url_for_railway_line_page
  end

  def link_to_railway_line_page_is_link_to_the_same_page?
    link_to_the_same_railway_line_page? and ( current_year.to_s == @survey_years.max.to_s )
  end
  
  def link_to_the_same_railway_line_page?
    [
      [ current_controller , @controller ] ,
      [ current_action , :action_for_railway_line_or_year_page ] ,
      [ current_railway_line , railway_line_page_name ]
    ].all? { | current_info , link_info |
      current_info.to_s == link_info.to_s
    }
  end

  def common_setting_of_url_for_year_page
    {
      controller: @controller ,
      action: :action_for_railway_line_or_year_page ,
      railway_line: railway_line_page_name ,
      only_path: true
    }
  end

  def proc_for_deciding_whether_add_link_to_year_page
    ::Proc.new { | year_i |
      link_to_the_same_railway_line_page? and ( ( current_year.to_s == year_i.to_s ) or ( current_year.blank? and @survey_years.max.to_s == year_i.to_s ) )
    }
  end

  def h_locals
    super.merge({
      survey_years: @survey_years ,
      #
      url_for_railway_line_page: url_for_railway_line_page ,
      add_link_to_railway_line_page: add_link_to_railway_line_page? ,
      #
      common_setting_of_url_for_year_page: common_setting_of_url_for_year_page ,
      proc_for_deciding_whether_add_link_to_year_page: proc_for_deciding_whether_add_link_to_year_page
    })
  end

end
