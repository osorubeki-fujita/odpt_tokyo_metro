class TokyoMetro::App::Renderer::FareTable::ToEachRailwayLine::StationInfos::GroupInfo < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , fare_normal_group_id , station_info , fare_normal_groups )
    super( request )

    @fare_normal_group = set_fare_normal_group( fare_normal_group_id , fare_normal_groups )
    @station_infos = [ station_info ]
  end

  def add( station_info )
    @station_infos << station_info
  end

  def render
    if @fare_normal_group.present?
      render_when_fare_normal_group_is_present
    else
      render_when_fare_normal_group_is_not_present
    end
  end

  private

  def h_locals
    super.merge({
      fare_normal_group: @fare_normal_group ,
      station_infos: @station_infos ,
      number_of_station_infos: @station_infos.length
    })
  end

  def set_fare_normal_group( fare_normal_group_id , fare_normal_groups )
    if fare_normal_group_id == 0
      nil
    else
      fare_normal_groups.find( fare_normal_group_id )
    end
  end

  # fare_normal_group_id が定義されている場合
  def render_when_fare_normal_group_is_present
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- fare_normal_group_decorated = fare_normal_group.decorate
- station_infos.each.with_index(1) do | station_info , i |
  - case i
  - when number_of_station_infos
    %tr{ class: :last }<
      = station_info.decorate.in_fare_table.render
      - if i == 1
        = fare_normal_group_decorated.render_columns( number_of_station_infos )
  - else
    %tr<
      = station_info.decorate.in_fare_table.render
      - if i == 1
        = fare_normal_group_decorated.render_columns( number_of_station_infos )
    HAML
  end

  def render_when_fare_normal_group_is_not_present
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- # fare_normal_group_id が定義されている場合
- # （運賃が設定されていない場合）
- station_infos.each.with_index(1) do | station_info , i |
  %tr<
    = station_info.decorate.in_fare_table.render
    - if i == 1
      %td{ colspan: number_of_station_infos , colspan: 4 , class: :no_fare }<>
        = " "
    HAML
  end

end
