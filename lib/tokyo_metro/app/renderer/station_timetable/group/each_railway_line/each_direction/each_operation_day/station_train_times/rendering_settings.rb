class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::RenderingSettings

  def initialize( terminal_station_infos , train_type_infos , major_terminal_station_info )
    @terminal_station_infos = terminal_station_infos
    @train_type_infos = train_type_infos
    @major_terminal_station_info = major_terminal_station_info
  end

  def has_one_terminal_station_info?
    @terminal_station_infos.length == 1
  end

  def has_one_train_type_info?
    @train_type_infos.map( &:in_api ).map( &:id ).uniq.length == 1
  end

  def major_terminal_station_info_id
    @major_terminal_station_info.id
  end

  def major_terminal_station_info_in_db
    @major_terminal_station_info.in_db
  end

  # @!group 詳細情報

  def to_render_precise_infos?
    !( not_to_render_precise_infos? )
  end

  # @!endgroup

  def with( object )
    set_object( object )
    return self
  end

  def set_object!( object )
    set_object( object )
    return nil
  end

  # @!group 行先

  def terminal_station_info_to_display
    if to_render_terminal_station_info?
      @terminal_station_infos.find_by( id: @object.terminal_station_info_id )
    else
      nil
    end
  end

  # @!group 列車種別

  def train_type_info_to_display
    if to_render_train_type_info?
      @train_type_infos.find_by( id: @object.train_type_info_id )
    else
      nil
    end
  end

  private

  # @!group 詳細情報

  def not_to_render_precise_infos?
    not_to_render_train_type_info? and has_one_terminal_station_info? and not_have_additional_infos?
  end

  # @!group 列車種別

  def to_render_train_type_info?
    !( not_to_render_train_type_info? )
  end

  def not_to_render_train_type_info?
    has_one_train_type_info?
  end

  # @!group 行先

  def to_render_terminal_station_info?
    !( not_to_render_terminal_station_info? )
  end

  def not_to_render_terminal_station_info?
    has_one_terminal_station_info? or ( bound_for_major_terminal_station? and not_last_train? )
  end

  def bound_for_major_terminal_station?
    @object.terminal_station_info_id == major_terminal_station_info_id
  end


  # @!group 補足情報

  def has_additional_infos?
    @object.has_additional_infos?
  end

  def not_have_additional_infos?
    !( has_additional_infos? )
  end

  # @!group 終電

  def last_train?
    @object.last_train?
  end

  def not_last_train?
    !( last_train? )
  end

  # @!endgroup

  def set_object( object )
    @object = object
  end

  def check_presence_of_object
    raise unless @object.present?
  end

end
