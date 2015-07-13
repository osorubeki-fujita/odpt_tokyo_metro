class TokyoMetro::App::Renderer::FareTable::ToEachRailwayLine::StationInfos::GroupList::Factory

  def initialize( request , station_infos , fares , fare_normal_groups )
    @request = request

    @station_infos = station_infos
    @fares = fares
    @fare_normal_groups = fare_normal_groups

    @ary = ::Array.new

    @fare_normal_group_id_now = nil
    @group_info = nil

    set_ary
  end

  def to_a
    ::TokyoMetro::App::Renderer::FareTable::ToEachRailwayLine::StationInfos::GroupList.new( @ary )
  end

  private

  def set_ary
    for i in 0..( @station_infos.length - 1 )
      station_info = @station_infos[i]
      fare = @fares.find_by( to_station_info_id: station_info.id )
      fare_normal_group_id = fare_normal_group_id( fare )

      # 運賃グループの最初の要素
      unless @fare_normal_group_id_now ==  fare_normal_group_id
        # 今までの hash_now を ary に追加し、初期化できるようにする。
        unless @group_info.nil?
          @ary << @group_info
        end
        @fare_normal_group_id_now = fare_normal_group_id
        @group_info = ::TokyoMetro::App::Renderer::FareTable::ToEachRailwayLine::StationInfos::GroupInfo.new( @request , @fare_normal_group_id_now , station_info , @fare_normal_groups )

      # 運賃グループの最初の要素ではない場合（前の駅の続きの場合）
      else
        @group_info.add( station_info )
      end

      # 最後の駅の処理
      if i == ( @station_infos.length - 1 )
        @ary << @group_info
      end
    end
  end

  # fare , fare_normal_group_id が存在しない場合は、fare_normal_group_id を便宜上 0 とする。
  def fare_normal_group_id( fare )
    if fare.nil?
      n = 0
    else
      n = fare.normal_group_id
      if n.nil?
        n = 0
      end
    end
    n
  end

end
