module TokyoMetro::Modules::Decision::Api::Station::ActualTerminal

  include ::TokyoMetro::Modules::Decision::Common::Station::ActualTerminal

  private

  # @param args [Regexp or String] 比較に使用する正規表現または文字列
  # @param compared [String] 比較対象（include されるクラスで指定する）
  # @note include されるクラス・モジュールで、super を用いるなどして上書きする。（include されるクラスにより、compared の部分が @terminal_station になったり @terminal_station_info_in_db.same_as になったりするため）
  def actually_terminating?( *args , compared: actual_terminal_stations )
    raise if args.empty?
    super( *args , compared )
  end

  alias :is_actually_terminating? :actually_terminating?
  alias :actually_terminate? :actually_terminating?

end
