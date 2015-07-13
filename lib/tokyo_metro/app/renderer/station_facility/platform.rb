class TokyoMetro::App::Renderer::StationFacility::Platform < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , station_facility_info )
    super( request )
    @station_facility_info = station_facility_info
    @platform_infos_grouped_by_railway_line = platform_infos_grouped_by_railway_line
    @type_of_platform_infos = type_of_platform_infos
  end

  def to_a
    ary = ::Array.new
    case @type_of_platform_infos
    when :between_wakoshi_and_hikawadai
      # puts @type_of_platform_infos
      ary << ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndHikawadai::Whole.new(
        request ,
        @platform_infos_grouped_by_railway_line.values.first ,
        ::RailwayLine.where( id: railway_line_ids_of_platform_infos )
      )

    when :kotake_mukaihara
      # puts @type_of_platform_infos
      ary << ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::KotakeMukaihara::Whole.new(
        request ,
        @platform_infos_grouped_by_railway_line.values.first ,
        ::RailwayLine.where( id: railway_line_ids_of_platform_infos )
      )

    when :meguro_and_shirokanedai
      # puts @type_of_platform_infos
      ary << ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::MeguroAndShirokanedai::Whole.new(
        request ,
        @platform_infos_grouped_by_railway_line.values.first ,
        ::RailwayLine.where( same_as: [ "odpt.Railway:TokyoMetro.Namboku" , "odpt.Railway:Toei.Mita" ] ).order( :id )
      )

    when :shirokane_takanawa
      # puts @type_of_platform_infos
      ary << ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::ShirokaneTakanawa::Whole.new(
        request ,
        @platform_infos_grouped_by_railway_line.values.first ,
        ::RailwayLine.where( same_as: [ "odpt.Railway:TokyoMetro.Namboku" , "odpt.Railway:Toei.Mita" ] ).order( :id )
      )

    when :normal
      # puts @type_of_platform_infos
      @platform_infos_grouped_by_railway_line.each do | railway_line_id , platform_infos |
        ary << ::TokyoMetro::App::Renderer::StationFacility::Platform::Info::Normal::Whole.new(
          request ,
          platform_infos ,
          ::RailwayLine.find( railway_line_id )
        )
      end

    end

    ::TokyoMetro::App::Renderer::StationFacility::Platform::List.new( @resuest , ary )
  end

  def self.make_list( request , station_facility_info )
    self.new( request , station_facility_info ).to_a
  end

  private

  def platform_infos_grouped_by_railway_line
    @station_facility_info.platform_infos.includes(
      :railway_direction ,
      :platform_barrier_free_facility_infos ,
      :platform_transfer_infos ,
      :platform_surrounding_areas ,
      :barrier_free_facility_infos ,
      :surrounding_areas
    ).group_by( &:railway_line_id )
  end

  def type_of_platform_infos
    if platform_infos_of_yurakucho_and_fukutoshin_line_between_wakoshi_and_hikawadai?
      :between_wakoshi_and_hikawadai
    elsif platform_infos_of_yurakucho_and_fukutoshin_line_at_kotake_mukaihara?
      :kotake_mukaihara

    elsif platform_infos_of_namboku_and_toei_mita_line_at_meguro_or_shirokanedai?
      :meguro_and_shirokanedai
    elsif platform_infos_of_namboku_and_toei_mita_line_at_shirokane_takanawa?
      :shirokane_takanawa

    else
      :normal
    end
  end

  def railway_line_ids_of_platform_infos
    @platform_infos_grouped_by_railway_line.keys.sort
  end

  # @!group 路線と駅の判定

  def platform_infos_of_yurakucho_and_fukutoshin_line_between_wakoshi_and_hikawadai?
    platform_infos_of_yurakucho_and_fukutoshin_line? and between_wakoshi_and_hikawadai?
  end

  def platform_infos_of_yurakucho_and_fukutoshin_line_at_kotake_mukaihara?
    platform_infos_of_yurakucho_and_fukutoshin_line? and at_kotake_mukaihara?
  end

  def platform_infos_of_namboku_and_toei_mita_line_at_meguro_or_shirokanedai?
    platform_infos_of_namboku_line? and ( at_meguro? or at_shirokanedai? )
  end

  def platform_infos_of_namboku_and_toei_mita_line_at_shirokane_takanawa?
    platform_infos_of_namboku_line? and at_shirokane_takanawa?
  end

  # @!group 路線の判定

  def platform_infos_of_yurakucho_and_fukutoshin_line?
    platform_infos_of?( *( ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringList.yurakucho_and_fukutoshin_line_same_as ) )
  end

  def platform_infos_of_namboku_line?
    platform_infos_of?( "odpt.Railway:TokyoMetro.Namboku" )
  end

  def platform_infos_of?( *ary )
    railway_line_ids_of_platform_infos.map { | railway_line_id | ::RailwayLine.find( railway_line_id ).same_as } == ary
  end

  # @!group 駅の判定

  def between_wakoshi_and_hikawadai?
    ary = ::TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_hikawadai_in_system
    at_these_stations?( ary )
  end

  def between_meguro_and_shirokane_takanawa?
    ary = ::TokyoMetro::Modules::Common::Dictionary::Station::StringList.namboku_and_toei_mita_line_common_stations_in_system
    at_these_stations?( ary )
  end

  [ :kotake_mukaihara , :meguro , :shirokanedai , :shirokane_takanawa ].each do | station_name |
    eval <<-DEF
      def at_#{ station_name }?
        at_these_stations?( "#{ station_name.camelize }" )
      end
    DEF
  end

  def at_these_stations?( *stations_in_system )
    [ stations_in_system ].flatten.map { | station | "odpt.StationFacility:TokyoMetro.#{station}" }.include?( @station_facility_info.same_as )
  end

  # @!endgroup

end
