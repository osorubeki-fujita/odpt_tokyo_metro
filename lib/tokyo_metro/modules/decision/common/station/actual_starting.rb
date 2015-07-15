module TokyoMetro::Modules::Decision::Common::Station::ActualStarting

  # @!group 列車の始発駅に関するメソッド (1) - 駅

  ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.constants( false ).each do | const_name |
    eval <<-DEF
      def actually_starting_at_#{ const_name.downcase }?
        actually_starting?( ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.#{ const_name.downcase } )
      end
    DEF

    #-------- [alias]
    [ :is_actually_starting_at , :actually_start_at ].each do | prefix |
      eval <<-ALIAS
        alias :#{ prefix }_#{ const_name.downcase }? :actually_starting_at_#{ const_name.downcase }?
      ALIAS
    end
  end

  ::TokyoMetro::Modules::Dictionary::Common::Station::RegexpInfo.constants( false ).each do | const_name |
    eval <<-DEF
      def actually_starting_at_#{ const_name.downcase }?
        actually_starting?( ::TokyoMetro::Modules::Dictionary::Common::Station::RegexpInfo.#{ const_name.downcase } )
      end
    DEF

    #-------- [alias]
    [ :is_actually_starting_at , :actually_start_at ].each do | prefix |
      eval <<-ALIAS
        alias :#{ prefix }_#{ const_name.downcase }? :actually_starting_at_#{ const_name.downcase }?
      ALIAS
    end
  end

  # @!group 列車の始発駅に関するメソッド (2) - 路線

  ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.constants( false ).each do | const_name |
    eval <<-DEF
      def actually_starting_on_#{ const_name.downcase }?
        actually_starting?( ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::RegexpInfo.#{ const_name.downcase } )
      end
    DEF

    #-------- [alias]
    [ :is_actually_starting_on , :actually_start_on ].each do | prefix |
      eval <<-ALIAS
        alias :#{ prefix }_#{ const_name.downcase }? :actually_starting_on_#{ const_name.downcase }?
      ALIAS
    end
  end

  # @!group 列車の始発駅に関するメソッド (3) - 区間

  def actually_starting_on_marunouchi_branch_line_including_invalid?
    actually_starting?( ::TokyoMetro::Modules::Dictionary::Common::Station::StringList.between_honancho_and_nakano_sakaue_including_invalid )
  end

  #-------- [alias]
  [ :is_actually_starting_on , :actually_start_on ].each do | prefix |
    eval <<-ALIAS
      alias :#{ prefix }_marunouchi_branch_line_including_invalid? :actually_starting_on_marunouchi_branch_line_including_invalid?
    ALIAS
  end

  # @!group 列車の始発駅に関するメソッド (4) - 東急東横線・みなとみらい線

  def actually_starting_on_tokyu_toyoko_or_minatomirai_line?
    actually_starting_on_tokyu_toyoko_line? or actually_starting_on_minatomirai_line?
 end

  def actually_starting_on_tokyu_toyoko_or_at_motomachi_chukagai?
    actually_starting_on_tokyu_toyoko_line? or actually_starting_at_motomachi_chukagai?
 end

  #-------- [alias]
  [ :is_actually_starting_on , :actually_start_on ].each do | prefix |
    eval <<-ALIAS
      alias :#{ prefix }_tokyu_toyoko_or_minatomirai_line? :actually_starting_on_tokyu_toyoko_or_minatomirai_line?
      alias :#{ prefix }_tokyu_toyoko_or_at_motomachi_chukagai? :actually_starting_on_tokyu_toyoko_or_at_motomachi_chukagai?
    ALIAS
  end

  # @!endgroup

  private

  # @param args [Regexp or String] 比較に使用する正規表現または文字列
  # @param compared [String] 比較対象（include されるクラスで指定する）
  # @note include されるクラス・モジュールで、super を用いるなどして上書きする。（include されるクラスにより、compared の部分が @starting_station になったり @starting_station_info_in_db.same_as になったりするため）
  def actually_starting?( *args , compared )
    compare_base( args , compared )
  end

  alias :is_actually_starting? :actually_starting?
  alias :actually_start? :actually_starting?

end
