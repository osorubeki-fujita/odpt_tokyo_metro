class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Bottom < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation

  def initialize( request , left_columns , columns_next_to_railway_line , right_columns , branch_railway_line_info )
    super( request , left_columns , columns_next_to_railway_line , right_columns )
    @position = :bottom
    @branch_railway_line_info = branch_railway_line_info
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%tr{ class: [ :through_operation_info_row , position ] , colspan: columns }
%tr{ class: [ :through_operation_info_row , position ] }
  %td{ class: :through_operation_infos , colspan: ( left_columns + columns_next_to_railway_line ) , rowspan: 2 }
    = jr_joban_line.render
  %td{ class: [ :railway_line_column , :chiyoda_joban ] , rowspan: 2 }<
    = " "
  - ( right_columns - 2 ).times do
    %td{ class: :empty_column , rowspan: 2 }<
      = " "
  = chiyoda_branch_line.render

%tr<
  %td{ colspan: 2 }<
    = " "

%tr{ class: [ :empty_row , position ] }
  %td{ colspan: columns }<
    = " "

%tr{ class: :additional_info_bottom }
  %td{ class: :chiyoda_line_fare , colspan: columns }
    %div{ class: [ :title , :content_header , :clearfix ] }
      %div{ class: :icon }
      %div{ class: :text }
        %div{ class: :text_ja }<
          = "北千住 - 綾瀬を通過する際の運賃のご案内"
        %div{ class: :text_en }<
          = "Fare through between Kita-senju and Ayase"
    %div{ class: :contents }
      %div{ class: :content }
        %h5{ class: :text_ja }<
          = ""
        %p{ class: :text_ja }<
          = ""
    HAML
  end

  private

  def h_locals
    h_locals_base.merge({
      jr_joban_line: ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Bottom::ToJrJobanLine.new( @request ) ,
      chiyoda_branch_line: ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Bottom::ChiyodaBranchLine.new( @request , @branch_railway_line_info )
    })
  end

end
