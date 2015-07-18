class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::ChiyodaLine::Bottom::ChiyodaBranchLine < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , branch_railway_line_info )
    super( request )
    @branch_railway_line_info = branch_railway_line_info
    @kita_ayase = @branch_railway_line_info.station_infos.find_by( same_as: "odpt.Station:TokyoMetro.ChiyodaBranch.KitaAyase" )
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%td{ class: [ :railway_line_column , :chiyoda , :kita_ayase ] }
  %div{ class: :travel_time_info_square }<
    = " "
%td{ class: [ :station_info , :auto_width , :kita_ayase ] }
  = kita_ayase.decorate.render_name_in_travel_time_infos
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_line_info: @branch_railway_line_info ,
      kita_ayase: @kita_ayase
    })
  end

end
