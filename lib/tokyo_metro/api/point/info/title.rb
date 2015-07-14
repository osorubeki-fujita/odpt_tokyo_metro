# 駅の出入口の名称を扱うクラス
class TokyoMetro::Api::Point::Info::Title

  include ::TokyoMetro::ClassNameLibrary::Api::Point
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info

  # Constructor
  def initialize( station_name , code , additional_name , elevator , closed )
    @station_name = station_name
    @code = code
    @additional_name = additional_name
    @elevator = elevator
    @closed = closed
  end

  attr_reader :station_name , :code , :additional_name , :elevator , :closed

  alias :has_elevator? :elevator
  alias :closed? :closed

  def to_s
    str_1 = to_s_sub_1
    unless @additional_name == ""
      str_1 += ( "/" + @additional_name )
    end
    if @elevator
      str_1 += "/【EV】"
    end
    if @closed
      str_1 += "/【閉】"
    end

    str_1
  end

  def to_s_sub_1
    if @code.blank?
      @station_name
    else
      [ @station_name , @code ].join( " " )
    end
  end

  private :to_s_sub_1

  def self.factory_for_this_class
    factory_for_generating_title_from_hash
  end

end