module TokyoMetro::Modules::Decision::Api::Station::ActualStarting

  include ::TokyoMetro::Modules::Decision::Common::Station::ActualStarting

  private

  # @param args [Regexp or String] 比較に使用する正規表現または文字列
  # @param compared [String] 比較対象（include されるクラスで指定する）
  def actually_starting?( *args , compared: actual_starting_stations )
    raise if args.empty?
    super( *args , compared )
  end

  alias :is_actually_starting? :actually_starting?
  alias :actually_start? :actually_starting?

end
