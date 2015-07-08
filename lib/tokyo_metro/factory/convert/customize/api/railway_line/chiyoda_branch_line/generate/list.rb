class TokyoMetro::Factory::Convert::Customize::Api::RailwayLine::ChiyodaBranchLine::Generate::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  def initialize( object )
    super( object )
    @chiyoda_main_line = @object.find { | item |
      item.same_as == ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_same_as
    }
    set_chiyoda_branch
  end

  private

  def process
    if @chiyoda_branch_line.present?
      delete_infos_related_to_kita_ayase_from_chiyoda_main_line

      set_fundamental_infos_of_chiyoda_branch_line

      delete_station_order_infos_related_to_stations_on_chiyoda_main_line_from_chiyoda_branch_line
      convert_name_and_set_index_of_stations_on_chiyoda_branch_line

      delete_travel_time_infos_related_to_stations_on_chiyoda_main_line_from_chiyoda_branch_line
      convert_station_name_in_travel_time_info_of_chiyoda_branch_line

      set_info_of_chiyoda_branch_line_to_ary
    end

    return nil
  end

  # 千代田線（本線）のデータを複製し、千代田線（支線）のデータを生成するメソッド
  def set_chiyoda_branch
    if @chiyoda_main_line.present?
      @chiyoda_branch_line = ::Marshal.load( ::Marshal.dump( @chiyoda_main_line ) )
    else
      @chiyoda_branch_line = nil
    end
  end

  # 千代田線（本線）の station_order, travel_time から北綾瀬の情報を削除するメソッド
  def delete_infos_related_to_kita_ayase_from_chiyoda_main_line
    @chiyoda_main_line.instance_eval do
      @station_order = @station_order.delete_if { | item |
        item.station == ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.kita_ayase_on_chiyoda_main_line
      }
      @travel_time = @travel_time.delete_if { | item |
        item.between?(
          ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.ayase_on_chiyoda_main_line ,
          ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.kita_ayase_on_chiyoda_main_line
        )
      }
    end
  end

  # 千代田線（支線）の基本情報を設定
  def set_fundamental_infos_of_chiyoda_branch_line
    @chiyoda_branch_line.instance_eval do
      @women_only_car = nil
      @dc_date = nil
      @region = nil
      @id_urn = nil
      @same_as = ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_branch_same_as
    end
  end

  # 千代田線（支線）の station_order から綾瀬・北綾瀬以外の情報を削除し、駅名を変換するメソッド
  def delete_station_order_infos_related_to_stations_on_chiyoda_main_line_from_chiyoda_branch_line
    @chiyoda_branch_line.station_order.keep_if { | item |
      [
        ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.kita_ayase_on_chiyoda_main_line ,
        ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.ayase_on_chiyoda_main_line
      ].include?( item.station )
    }
  end

  # 千代田線（支線）の station_order の綾瀬・北綾瀬の駅名を変換し、番号を振り直すメソッド
  def convert_name_and_set_index_of_stations_on_chiyoda_branch_line
    regexp = self.class.regexp_for_replace
    @chiyoda_branch_line.station_order.each_with_index do | item , i |
      item.instance_eval do
        @station = @station.gsub( regexp , ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_branch_in_system )
        @index = i
      end
    end
  end

  # 千代田線（支線）の travel_time から綾瀬・北綾瀬以外の情報を削除するメソッド
  def delete_travel_time_infos_related_to_stations_on_chiyoda_main_line_from_chiyoda_branch_line
    @chiyoda_branch_line.travel_time.keep_if { | item |
      item.between?(
        ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.ayase_on_chiyoda_main_line ,
        ::TokyoMetro::Modules::Common::Dictionary::Station::StringInfo.kita_ayase_on_chiyoda_main_line
      )
    }
  end

  # 千代田線（支線）の travel_time の綾瀬・北綾瀬の駅名を変換するメソッド
  def convert_station_name_in_travel_time_info_of_chiyoda_branch_line
    regexp = self.class.regexp_for_replace
    @chiyoda_branch_line.travel_time.each do | item |
      item.instance_eval do
        @from_station , @to_station = [ @from_station , @to_station ].map { | station_name |
          station_name.gsub( regexp , ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_branch_in_system )
        }
      end
    end
  end

  # 路線情報の配列に千代田線（支線）のインスタンスを追加するメソッド
  def set_info_of_chiyoda_branch_line_to_ary
    @object << @chiyoda_branch_line
  end

  def self.regexp_for_replace
    ::TokyoMetro::Factory::Convert::Dictionary::RegexpForReplace.chiyoda_branch_line_stations
  end

end
