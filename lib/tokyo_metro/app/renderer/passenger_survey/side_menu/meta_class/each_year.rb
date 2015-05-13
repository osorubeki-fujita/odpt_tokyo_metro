class TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::MetaClass::EachYear < TokyoMetro::App::Renderer::MetaClass

  def initialize( request , survey_year , survey_year_max , railway_line_page_name , only_year: true )
    super( request )
    @survey_year = survey_year
    @survey_year_max = survey_year_max
    @railway_line_page_name = railway_line_page_name
    @only_year = only_year

    set_url
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: li_classes }
  = link_to_unless( without_link , "" , url )
  - if only_year
    %p{ class: :text_en }<
      = survey_year
  - else
    %p{ class: :text_ja }<
      = survey_year.to_s + "年度"
    %p{ class: :text_en }<
      = "In " + survey_year.to_s
    HAML
  end

  private

  def set_url
    @url = url_helpers.url_for(
      controller: :passenger_survey ,
      action: :action_for_railway_line_or_year_page ,
      railway_line: @railway_line_page_name ,
      survey_year: @survey_year ,
      only_path: true
    )
  end

  def h_locals
    super.merge({
      survey_year: @survey_year ,
      survey_year_max: @survey_year_max ,
      url: @url ,
      only_year: @only_year ,
      without_link: without_link? ,
      li_classes: li_classes
    })
  end

  def without_link?
    current_page?( @url ) or ( link_to_the_same_railway_line? and link_to_the_same_survey_year? )
  end

  def link_to_the_same_railway_line?
    current_page?(
      controller: :passenger_survey ,
      action: :action_for_railway_line_or_year_page ,
      railway_line: @railway_line_page_name
    )
  end

  def link_to_the_same_survey_year?
    current_page?( survey_year: @survey_year ) or ( current_page?( survey_year: nil ) and ( @survey_year_max.to_s == @survey_year.to_s ) )
  end
  
  def li_classes
    ary = [ :survey_year ]
    if without_link?
      ary << :this_year
    end
    ary
  end

end