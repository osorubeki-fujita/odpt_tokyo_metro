class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::RenderingSettings

  def initialize( object , terminal_station_infos , train_type_infos , one_train_type_info , one_terminal_station_info , major_terminal_station_info_id )
    @object = object

    @terminal_station_infos = terminal_station_infos
    @train_type_infos = train_type_infos

    @one_train_type_info = one_train_type_info
    @one_terminal_station_info = one_terminal_station_info

    @major_terminal_station_info_id = major_terminal_station_info_id
  end

  # @!group 行先

  def terminal_station_info
    @terminal_station_infos.find_by( id: @object.terminal_station_info_id )
  end

  def of_displayed_terminal_station_info
    if to_render_terminal_station_info?
      terminal_station_info
    else
      nil
    end
  end

  # @!group 列車種別

  def train_type_info
    @train_type_infos.find_by( id: @object.train_type_info_id )
  end

  def of_displayed_train_type_info
    if to_render_train_type_info?
      train_type_info
    else
      nil
    end
  end

  # @!group 詳細情報

  def to_render_precise_infos?
    !( not_to_render_precise_infos? )
  end

  # @!endgroup

  private

  # @!group 詳細情報

  def not_to_render_precise_infos?
    not_to_render_train_type_info? and @one_terminal_station_info and not_have_additional_infos?
  end

  # @!group 列車種別

  def to_render_train_type_info?
    !( not_to_render_train_type_info? )
  end

  def not_to_render_train_type_info?
    @one_train_type_info
  end

  # @!group 行先

  def to_render_terminal_station_info?
    !( not_to_render_terminal_station_info? )
  end

  def not_to_render_terminal_station_info?
    @one_terminal_station_info or ( bound_for_major_terminal_station? and not_last_train? )
  end

  def bound_for_major_terminal_station?
    @object.terminal_station_info_id == @major_terminal_station_info_id
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

end
