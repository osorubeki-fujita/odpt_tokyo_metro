class TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::MetaClass < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request )
    super( request )
    @all_railway_line_infos = ::Railway::Line::Info.tokyo_metro( including_branch_line: false )
    @survey_years = ::PassengerSurvey.all.pluck( :survey_year ).uniq.sort
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ id: ul_class , class: [ :links , :clearfix ] }
  = proc_for_links_to_railway_line_pages.call
  = proc_for_links_to_year_pages.call
  - # = proc_for_links_to_station_pages.call
    HAML
  end

  private

  def h_locals
    super.merge({
      proc_for_links_to_railway_line_pages: proc_for_links_to_railway_line_pages ,
      proc_for_links_to_year_pages: proc_for_links_to_year_pages ,
      proc_for_links_to_station_pages: proc_for_links_to_station_pages ,
      ul_class: ul_class
    })
  end

  def proc_for_links_to_railway_line_pages
    ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: { request: request , all_railway_line_infos: @all_railway_line_infos , survey_years: @survey_years }
%ul{ id: :links_to_railway_line_pages , class: :links }
  %li{ class: [ :title , :in_station_page ] }<
    != "各路線 各駅の乗降客数"
    %span{ class: :small }<
      = "（年度別）"
  - all_railway_line_infos.each do | railway_line |
    = ::TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::LinkToRailwayLinePage.new( request , railway_line.decorate , survey_years ).render
      HAML
    }
  end

  def proc_for_links_to_year_pages
    li_classes = [ :tokyo_metro , :small ]
    if current_railway_line.to_s == "all"
      li_classes << :this_page
    end
    h_locals_i = {
      request: request ,
      survey_years: @survey_years ,
      li_classes: li_classes ,
      survey_year_max: @survey_years.max ,
      without_link_to_operator_main_page: without_link_to_operator_main_page?
    }
    ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%ul{ id: :links_to_year_pages , class: [ :links , :in_side_menu ] }
  %li{ class: [ :title , :to_year_pages ] }<
    != "全路線 全駅の乗降客数"
    %span{ class: :small }<
      = "（年度別）"
  %ul{ class: [ :operator , :clearfix ] }
    %li{ class: li_classes }
      - unless without_link_to_operator_main_page
        = ::PassengerSurveyDecorator.link_to_year_page( nil )
      %div{ class: [ :link_to_operator_page , :clearfix ] }
        %div{ class: :icon }
          = ::TokyoMetro::App::Renderer::Icon.tokyo_metro( request , 2 ).render
        %div{ class: :text }
          %p{ class: :text_ja }<
            = "東京メトロ 全駅"
          %p{ class: :text_en }<
            = "All stations of Tokyo Metro"
      - survey_years.sort.reverse.each do | survey_year |
        = ::TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::MetaClass::EachYear.new( request , survey_year , survey_year_max , :all ).render
      HAML
    }
  end

  def proc_for_links_to_station_pages
    ::Proc.new {
      h.render inline: <<-HAML , type: :haml
%ul{ id: :links_to_station_pages , class: :links }
  %li{ class: [ :title , :passenger_info_header ] }<
    != "各駅の乗降客数"
    %span{ class: :small }<
      = "（年度別）"
      HAML
    }
  end

  def ul_class
    :links_to_passenger_survey_pages
  end

  def without_link_to_operator_main_page?
    current_page?( controller: :passenger_survey , action: :action_for_railway_line_or_year_page , railway_line: :all ) and ( current_page?( survey_year: @survey_years.max ) or current_page?( survey_year: nil ) )
  end

end
