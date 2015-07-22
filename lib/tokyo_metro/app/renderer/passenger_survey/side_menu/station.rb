class TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::Station < TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::MetaClass

  def initialize( request , station_info )
    super( request )

    if station_info.at_kita_ayase? or station_info.between_honancho_and_nakano_shimbashi?
      @prior_railway_line_info_ids = station_info.railway_line.main_railway_line_info.id
    else
      railway_line_infos = station_info.railway_line_infos_of_tokyo_metro
      @prior_railway_line_info_ids = railway_line_infos.pluck( :railway_line_info_id ).uniq
    end
  end

  private

  def railway_lines_prior
    @all_railway_lines.where( id: @prior_railway_line_info_ids )
  end

  def railway_lines_not_prior
    @all_railway_lines.where.not( id: @prior_railway_line_info_ids )
  end

  def proc_for_links_to_railway_line_pages
    ::Proc.new {
      h_locals_for_this_proc = {
        request: request ,
        railway_lines_prior: railway_lines_prior ,
        railway_lines_not_prior: railway_lines_not_prior ,
        survey_years: @survey_years
      }
      h.render inline: <<-HAML , type: :haml , locals: h_locals_for_this_proc
%ul{ id: :links_to_railway_line_pages_of_this_station , class: :links }
  %li{ class: [ :title , :in_station_page ] }<
    != "この駅に乗り入れている路線の乗降客数"
    %span{ class: :small }<
      = "（年度別）"
  - railway_lines_prior.each do | railway_line |
    = ::TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::LinkToRailwayLinePage.new( request , railway_line.decorate , survey_years , additional_class_of_li: :this_station ).render
%ul{ id: :links_to_railway_line_pages , class: :links }
  %li{ class: [ :title , :in_station_page ] }<
    != "その他の路線の乗降客数"
    %span{ class: :small }<
      = "（年度別）"
  - railway_lines_not_prior.each do | railway_line |
    = ::TokyoMetro::App::Renderer::PassengerSurvey::SideMenu::LinkToRailwayLinePage.new( request , railway_line.decorate , survey_years ).render
      HAML
    }
  end

end
