# @note
#   This module is prepended
#     to {TokyoMetro::Factory::Seed::Api::Station::Info::ConnectingRailwayLine::Info}
#     by {TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine.set_modules} .
module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::ConnectingRailwayLine::Factory::Seed::Info::ConnectingRailwayLine::Info

  class << self

    def db_instance_class_of_connecting_railway_line_note
      ::ConnectingRailwayLine::Note
    end

  end

  private

  # @todo railway_line_id の列を廃止する（他社線の駅名情報も DB に登録し、すべての railway_line_id へ station_info_id からアクセスできるようにする）
  def hash_to_db
    super.merge({
      # station_info_id: @station_info_id ,
      # railway_line_id: railway_line_id ,
      index_in_station: @info.index_in_station ,
      connecting_station_info_id: connecting_station_info_id ,
      connecting_to_another_station: connecting_to_another_station? ,
      cleared: cleared? ,
      not_recommended: not_recommended? ,
      note_id: note_id ,
      start_on: @info.start_on ,
      end_on: @info.end_on ,
      hidden_on_railway_line_page: hidden_on_railway_line_page?
    })
  end

  [ :connecting_to_another_station? , :cleared? , :recommended? , :not_recommended? , :hidden_on_railway_line_page? ].each do | method_name |
    eval <<-DEF
      def #{method_name}
        @info.#{method_name}
      end
    DEF
  end

  def connecting_station
    if connecting_to_another_station?
      station_info = ::Station::Info.find_by( railway_line_id: railway_line_id , same_as: @info.connecting_station )
      unless station_info.present?
        raise "Error: railway_line_id: #{railway_line_id} / same_as: #{ @info.connecting_another_station }"
      end
      return station_info
    else
      station_name_in_system = ::Station::Info.find( @station_info_id ).name_in_system
      connecting_station = ::Station::Info.find_by( railway_line_id: railway_line_id , name_in_system: station_name_in_system )
      if connecting_station.present?
        connecting_station
      else
        nil
      end
    end
  end

  def connecting_station_info_id
    connecting_station.try( :id )
  end

  def note_id
    if @info.note.present?
      self.class.db_instance_class_of_connecting_railway_line_note.find_or_create_by( ja: @info.note ).id
     else
      nil
    end
  end

end
