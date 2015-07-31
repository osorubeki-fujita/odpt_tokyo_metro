# 方面の情報を扱うクラス
class TokyoMetro::Static::RailwayDirection::Info < TokyoMetro::Static::Fundamental::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayDirection

  def initialize( same_as , in_api_same_as , railway_line , railway_direction_code , station )
    raise "Error: #{ station } (Class: #{ station.class.name }) is not valid." unless /\Aodpt.Station:/ === station
    @same_as = same_as
    @in_api_same_as = in_api_same_as
    @railway_line = railway_line
    @railway_direction_code = railway_direction_code
    @station = station
  end

  attr_reader :same_as , :in_api_same_as , :railway_line , :railway_direction_code , :station

end
