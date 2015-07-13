class TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( station_train_times )
    @grouped_by_hour = station_train_times.group_by( &:hour_in_station_timetable )

    @terminal_station_infos = ::Station::Info.where( id: terminal_station_info_ids )
    @train_type_infos = ::Train::Type::Info.includes( :in_api ).where( id: train_type_info_ids )
    @car_compositions = ids_in_station_train_times( :car_composition ).select( &:present? )

    # ::TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::MajorTerminalStation
    major_terminal_station_info = MajorTerminalStation.new( station_train_times_flattened , @terminal_station_infos )

    # TokyoMetro::App::Renderer::StationTimetable::Group::EachRailwayLine::EachRailwayDirection::EachOperationDay::StationTrainTimes::RenderingSettings
    @rendering_settings = RenderingSettings.new( @terminal_station_infos , @train_type_infos , major_terminal_station_info )
  end

  attr_reader :grouped_by_hour
  attr_reader :terminal_station_infos
  attr_reader :train_type_infos
  attr_reader :car_compositions

  attr_reader :major_terminal_station_info

  def hours
    midnight_hours = [ 0 , 1 , 2 ]
    a = @grouped_by_hour.keys.sort

    midnight_hours.each do | midnight_hour |
      if a.include?( midnight_hour )
        a = a - [ midnight_hour ]
        a = a + [ midnight_hour ]
      end
    end

    a
  end

  def render_body
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%tbody
  - this.hours.each do |h|
    - station_train_times_in_an_hour = this.grouped_by_hour[h].sort_by( &:min_in_station_timetable )
    %tr{ class: :hour_row }
      %td{ class: :hour }<
        = h
      %td{ class: [ :station_train_times , cycle( :odd , :even ) ] }
        - station_train_times_in_an_hour.each do | station_train_time |
          = station_train_time.decorate.render_in_station_timetable( rendering_settings )
    HAML
  end

  def render_message_in_header
    h.render inline: <<-HAML , type: :haml , locals: { ja: message_in_header_ja , en: message_in_header_en }
%tr
  %td{ colspan: 2 , class: :train_type_and_terminal_station_infos }<
    %div{ class: :text_ja }<
      = ja
    %div{ class: :text_en }<
      = en
    HAML
  end

  private

  def station_train_times_flattened
    @grouped_by_hour.values.flatten
  end

  def ids_in_station_train_times( method_name )
    station_train_times_flattened.map { | station_train_time | station_train_time.send( method_name ) }.uniq
  end

  def terminal_station_info_ids
    ids_in_station_train_times( :terminal_station_info_id )
  end

  def train_type_info_ids
    ids_in_station_train_times( :train_type_info_id )
  end

  def h_locals
    super.merge({
      this: self ,
      rendering_settings: @rendering_settings
    })
  end

  [ :has_one_terminal_station_info? , :has_one_train_type_info? ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @rendering_settings.#{ method_name }
      end
    DEF
  end

  def message_in_header_ja
    str = ::String.new
    if has_one_terminal_station_info? or has_one_train_type_info?
      str << "列車はすべて "
      if has_one_train_type_info?
        str << @train_type_infos.first.in_api.name_ja
        str << " "
      end
      if has_one_terminal_station_info?
        str << @terminal_station_infos.first.name_ja
        str << " 行き "
      end
      str << "です。"
      unless has_one_terminal_station_info?
        str << "なお、"
      end
    end

    unless has_one_terminal_station_info?
      str << "行先の記載がない列車はすべて "
      str << major_terminal_station_info_in_db.name_ja
      str << " 行きです。"
    end
    str
  end

  def message_in_header_en
    str = ::String.new
    if has_one_terminal_station_info? or has_one_train_type_info?
      str << "All trains are"
      if has_one_train_type_info?
        str << " "
        str << @train_type_infos.first.in_api.name_en
      end
      if has_one_terminal_station_info?
        str << " "
        str << "bound for "
        str << @terminal_station_infos.first.name_en
      end
      str << "."
      unless has_one_terminal_station_info?
        str << " "
      end
    end

    unless has_one_terminal_station_info?
      str << "All trains with no description of destination are bound for "
      str << major_terminal_station_info_in_db.name_en
      str << "."
    end
    str
  end

  def major_terminal_station_info_in_db
    @rendering_settings.major_terminal_station_info_in_db
  end

end
