class TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinksToRailwayLinePages < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request )
    super( request )
    @railway_lines = ::RailwayLine.tokyo_metro( including_branch_line: false )

    @controllers = {
      train_operation: {
        ja: ::Train::Operation::InfoDecorator.common_title_ja ,
        en: ::Train::Operation::InfoDecorator.common_title_en
      } ,
      train_location: {
        ja: ::Train::Location::InfoDecorator.common_title_ja ,
        en: ::Train::Location::InfoDecorator.common_title_en
      } ,
      railway_line: {
        ja: ::RailwayLineDecorator.common_title_ja ,
        en: ::RailwayLineDecorator.common_title_en
      }
    }
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :links_to_real_time_info_pages_of_railway_lines }
  %div{ class: :title }<
    %div{ class: :text_ja }<
      = "各路線のご案内"
    %div{ class: :text_en }<
      = "Pages related to railway lines"
  %ul{ id: :links_to_railway_line_pages , class: [ :links , :clearfix ] }
    - railway_lines.each do | railway_line |
      = ::TokyoMetro::App::Renderer::RealTimeInfos::SideMenu::LinkToRailwayLinePage.new( request , railway_line.decorate , controllers ).render
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_lines: @railway_lines ,
      controllers: @controllers
    })
  end

end
