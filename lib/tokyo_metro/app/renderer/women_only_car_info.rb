class TokyoMetro::App::Renderer::WomenOnlyCarInfo < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_infos )
    super( request )
    @railway_line_infos = railway_line_infos
    set_infos
  end

  def render
    if @infos.present?
      h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :women_only_car }
  = ::TokyoMetro::App::Renderer::WomenOnlyCarInfo::Header.new( request ).render
  - if infos.length > 1
    - infos.each do | infos_of_a_railway_line_info |
      = infos_of_a_railway_line_info.render( display_railway_line: true )
  - else
    = infos.first.render
      HAML
    end
  end

  private

  def set_infos
    if @railway_line_infos.instance_of?( ::Railway::Line::Info )
      infos_in_db = ::Railway::Line::WomenOnlyCarInfo.where( railway_line_info_id: @railway_line_infos.id )
    else
      infos_in_db = ::Railway::Line::WomenOnlyCarInfo.where( railway_line_info_id: @railway_line_infos.pluck( :id ) )
    end

    @infos = infos_in_db.includes( :operation_day , :from_station_info , :to_station_info ).to_a.group_by( &:railway_line_info_id ).map { | railway_line_info_id , infos |
      ::TokyoMetro::App::Renderer::WomenOnlyCarInfo::EachRailwayLine.new( @request , ::Railway::Line::Info.find( railway_line_info_id ) , infos )
    }
  end

  def h_locals
    super.merge({
      infos: @infos
    })
  end

end
